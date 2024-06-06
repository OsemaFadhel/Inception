# Inception

This project aims to broaden your knowledge of system administration by using Docker.
You will virtualize several Docker images, creating them in your new personal virtual
machine.

<h2 align="center"> <img src="https://github.com/OsemaFadhel/Inception/blob/main/img/inc.png" width="400" height="500" /> </h2>

# How Docker and Docker Compose Work

Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow developers to package an application with all of its dependencies (libraries, tools, etc.), ensuring it runs smoothly in any environment. <br>

Docker Compose is a tool that helps you define and manage multi-container Docker applications. With Docker Compose, you can use a YAML file to configure your application’s services (e.g., a web server, a database, etc.). Then, with a single command, you can start all the services defined in the configuration. <br>

<h3 align="left"> Simple Explanation: </h3>

- Docker: Think of Docker as a way to package your application into a box (container) that includes everything it needs to run. This box can then be shipped and run anywhere.

- Docker Compose: Imagine you have several boxes (containers) that together form your application (e.g., a web server, a database). Docker Compose helps you describe how these boxes fit together and then allows you to run them all with one command.<br>

# Benefits of Docker Compared to Virtual Machines (VMs)

Virtual Machines (VMs) are an older way to run multiple isolated applications on a single physical machine. Each VM includes a full copy of an operating system, along with the application and its dependencies, which can make them quite large and resource-intensive.

<h3 align="left"> Benefits of Docker over VMs: </h3>

- Lightweight: Docker containers share the host system's kernel and don't need a full operating system. This makes them much smaller and faster to start compared to VMs. <br>
- Resource Efficiency: Containers use less CPU and memory compared to VMs because they don't need to run a separate OS. <br>
- Portability: Containers include everything the application needs, making them easy to run anywhere, whether on a developer's laptop, on-premises servers, or in the cloud. <br>
- Faster Deployment: Because containers are lightweight and don't require a full OS boot, they start much faster than VMs. <br>

# Simple Explanation of Docker Network
Docker Network allows containers to communicate with each other and with the outside world. It's like setting up a network of rooms (containers) in a building (your computer or server) where each room can talk to other rooms and also connect to the internet.

<h3>Key Points:</h3>

<h4>Types of Networks: <h4>

Docker provides different types of networks like bridge, host, and overlay.

- Bridge Network: The default network type for containers. Containers on the same bridge network can communicate with each other directly.
- Host Network: The container shares the host's networking stack, meaning it uses the host’s IP address.
- Overlay Network: Used for multi-host networking, allowing containers running on different Docker hosts to communicate with each other.

<h3>Creating a Network:</h3>

You can create custom networks where you can control how containers communicate.

- For example, using docker network create my_network, you create a custom network named my_network.

<h3> Connecting Containers: </h3>

You can connect containers to a network so they can talk to each other.

- For instance, running docker run --network my_network my_container connects my_container to the my_network network.

# What is Nginx?

Nginx is a powerful, open-source web server and reverse proxy server. It's often used to serve static files, manage server load, and act as a gateway for dynamic content.

<h3>Key Points:</h3>

- Web Server: Nginx can serve web pages to users, handling multiple requests efficiently.
- Reverse Proxy: It can sit in front of other servers, forwarding client requests to them and passing their responses back to clients. This helps distribute the load and improve performance.
- Load Balancer: Nginx can distribute incoming traffic across multiple servers to ensure no single server gets overwhelmed.
- Caching: It can store copies of frequently accessed content to speed up response times for users.

<h2>What is a TLS v1.2/v1.3 Certificate? </h2>

TLS (Transport Layer Security) is a protocol that ensures privacy and data integrity between clients and servers over the internet. TLS v1.2 and v1.3 are versions of this protocol.

<h3>Key Points:</h3>

- Encryption: TLS encrypts data sent between a client (like a web browser) and a server, making it secure from eavesdroppers.
- Authentication: TLS certificates verify the server’s identity, ensuring users are connecting to the right website.
- Data Integrity: TLS ensures that data is not tampered with during transmission.
