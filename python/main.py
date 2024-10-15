import requests
import json
import tfvars
from google.cloud import storage

with open ('../credentials/best-buy-api-key.txt', 'r') as f:
    api_key = f.read()

products_api_url = f'https://api.bestbuy.com/v1/products?apiKey={api_key}&sort=sku.asc&show=accessories.sku,addToCartUrl,bestSellingRank,categoryPath.id,categoryPath.name,color,condition,customerReviewAverage,customerReviewCount,description,details.name,details.value,dollarSavings,features.feature,freeShipping,frequentlyPurchasedWith.sku,image,includedItemList.includedItem,inStoreAvailability,inStoreAvailabilityText,longDescription,manufacturer,mobileUrl,modelNumber,name,onlineAvailability,onlineAvailabilityText,onSale,percentSavings,preowned,regularPrice,relatedProducts.sku,salePrice,shipping,shippingCost,shortDescription,sku,thumbnailImage,type,upc,url&pageSize=50&format=json'

tfv = tfvars.LoadSecrets('../terraform/terraform.tfvars')

credentials = tfv['GCP_CREDENTIAL_KEYS']
bucket_id = tfv['GCS_BUCKET_NAME']
file_path = 'products.json'
blob_name = 'products.json'


def download_json(url, json_file):
    # Download data from an API and save as a JSON file

    response = requests.get(url)
    response_json = json.loads(response.text)
    products_json = response_json['products']

    with open(json_file, 'w') as f:
        json.dump(products_json, f)


def upload_blob(bucket_name, source_file_name, destination_blob_name):
    #Uploads a file to the bucket.

    storage_client = storage.Client.from_service_account_json(f'../{credentials}')
    bucket = storage_client.bucket(bucket_name)
    blob = bucket.blob(destination_blob_name)

    blob.upload_from_filename(source_file_name)

    print(
        f"File {source_file_name} uploaded to {destination_blob_name}."
    )


download_json(products_api_url, file_path)

upload_blob(bucket_id, file_path, blob_name)
