$ ->
  $(".s3-uploader").S3Uploader()
  $(".s3-uploader").bind "ajax:success", (e, data) ->
    $(this).closest("table.question").find("ul.addition").append(data)
