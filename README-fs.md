View uniform bucket-level access status
---------------------------------------
gcloud storage buckets describe gs://bh-apps.appspot.com --format="default(uniform_bucket_level_access)"

Set it
------
gcloud storage buckets update gs://bh-apps.appspot.com --uniform-bucket-level-access

Make a portion of a bucket publicly readable
--------------------------------------------
gcloud storage managed-folders create gs://bh-apps.appspot.com/flutter-content-example

Set access permissions on the managed folder
--------------------------------------------
Roles: see https://cloud.google.com/storage/docs/access-control/iam-roles

gcloud storage managed-folders add-iam-policy-binding gs://bh-apps.appspot.com/flutter-content-example --member=allUsers --role=roles/storage.objectCreator

Firebase Storage Browser
========================
https://console.cloud.google.com/storage/browser/bh-apps.appspot.com/flutter-content-example?project=bh-apps
https://console.cloud.google.com/storage/browser/bh-apps.appspot.com;tab=objects\\
    \\
    ? project=bh-apps\\
    & prefix=\\
    & forceOnObjectsSortingFiltering=false
