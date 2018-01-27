module PhotosHelper
  
  #return image name(string) with extension, exp: "image_name.jpg"
  def file_name photo
    return photo.image_identifier
  end

  #This function connect to aws by aws-sdk and returns a url to download file from bucket
  def download_image(photo)
    #set aws region to client - was needed to change default region
    client = Aws::S3::Client.new(region: 'sa-east-1')
    #new resource with the client region updated
    resource = Aws::S3::Resource.new(client: client)

    #get the object in the bucket
    obj = resource.bucket(ENV['S3_BUCKET_NAME']).object(photo.image.file.file.key)
    #get url of object
    url = obj.presigned_url(:get, expires_in: 3600, response_content_disposition: "attachment; filename=#{file_name(photo)}")
    
    #return downloadable image link
    return url
  end
end
