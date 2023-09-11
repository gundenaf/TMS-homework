## Goal: Work with Jenkins agents

## Tasks:

1. Install Jenkins master server on Linux VM
2. Install Jenkins node 1 on another Linux VM
3. Install Jenkins node 2 ("docker" label) on another Linux VM (* optional - set Docker container as Jenkins node 2) 
4. Create Jenkins CI/CD pipeline 1 using this exapmle code for "dummy app" (don't forget about CI/CD logics!!!)
5. Create Jenkins CI/CD pipeline 2 using this exapmle code with building/pushing docker image stages for "dummy app"
6. Build pipeline 1 on node 1
7. Build pipeline 2 on node 1 + execute stages with docker on node 2 ("docker" label)