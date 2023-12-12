-- Create the example table
CREATE TABLE example (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    description TEXT
);

-- Insert data into the example table
INSERT INTO example (name, description) VALUES
    ('Cloud Computing (AWS)', 'Amazon Web Services (AWS) is a comprehensive cloud computing platform providing a wide range of services.'),
    ('CI/CD (Jenkins)', 'Jenkins is an open-source automation server for implementing Continuous Integration and Continuous Delivery (CI/CD).'),
    ('Infrastructure as Code (Terraform)', 'Terraform is an Infrastructure as Code (IaC) tool that allows defining and provisioning infrastructure in a declarative configuration language.'),
    ('Docker and Microservice Architecture', 'Docker facilitates containerization, and Microservice Architecture is an approach to developing a single application as a set of small, independent services.'),
    ('Kubernetes (K8s)', 'Kubernetes is an open-source container orchestration platform for automating the deployment, scaling, and management of containerized applications.'),
    ('Version Control System (Git)', 'Git is a distributed version control system for tracking changes in source code during software development.'),
    ('Python', 'Python is a high-level, versatile programming language used for various applications, including web development, data analysis, and automation.'),
    ('Linux + Unix Utilities + Bash/Shell', 'Linux and Unix are operating systems, and Bash/Shell are scripting languages used for system administration and automation.'),
    ('Computer Networks', 'Computer Networks involve the study and design of communication systems for connecting computers and devices.'),
    ('Virtualization', 'Virtualization enables running multiple operating systems or applications on a single physical server to optimize resource utilization.'),
    ('Configuration Management (Ansible)', 'Ansible is an open-source automation tool used for configuration management, application deployment, and task automation.'),
    ('Databases (MySQL/MariaDB, PostgreSQL)', 'MySQL, MariaDB, and PostgreSQL are relational database management systems (RDBMS) used for storing and managing structured data.'),
    ('Web Servers (Apache, nginx)', 'Apache and nginx are popular web servers used to serve web content and applications.'),
    ('SSL/TLS', 'SSL (Secure Sockets Layer) and TLS (Transport Layer Security) are cryptographic protocols ensuring secure communication over a computer network.'),
    ('Monitoring (Zabbix, Prometheus, Grafana)', 'Zabbix, Prometheus, and Grafana are monitoring tools used to track and visualize the performance and health of IT systems.'),
    ('Logging (ELK)', 'ELK (Elasticsearch, Logstash, and Kibana) is a stack for centralized logging, processing, and visualization of log data.'),
    ('Agile/Scrum', 'Agile is a project management and product development approach, and Scrum is an Agile framework for managing complex knowledge work.')
;
