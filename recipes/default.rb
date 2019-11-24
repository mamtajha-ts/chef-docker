# Using docker_service for installation and configuration
docker_service 'default' do
        action [:create, :start]
end

# Pull latest image
docker_image 'nginx' do
  tag 'latest'
  action :pull
end

# Build Image
docker_image 'mamtaj/apache2' do
        tag 'v1'
        source '/tmp/Dockerfile'
        action :build
end

# Run container mapping containers port 80 to the host's port 80
docker_container 'my_nginx' do
  repo 'nginx'
  tag 'latest'
  port '81:80'
end

# Run container mapping containers port 80 to the host's port 80
docker_container 'my_wordpress' do
  repo 'mamtaj/apache2'
  tag 'v1'
  port '8080:80'
end
