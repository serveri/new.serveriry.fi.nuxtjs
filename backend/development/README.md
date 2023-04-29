# Serveri ry development infra

This is development environment for serveri ry infrastructure.

## Running environment

See [dependencies](../README.md#dependencies) for environment.

Run command ``vagrant up`` in the path that contain [Vagrantfile](/development/Vagrantfile)

View the webpage in [localhost:8080](http://127.0.0.1:8080/).

View the directus admin in [localhost:8081](http://127.0.0.1:8081/).

---

## Vagrant Commands

### Start vagrant / virtual machine

``vagrant up``

### Run VM configuration files again (ansible playbooks)

``vagrant provision``

### Interact with virtual machine

``vagrant ssh``

### Stop virtual machine

``vagrant halt``

### Delete vagrant / virtual machine

``vagrant destroy``

### Restart vagrant

``vagrant reload``

- works for reloading vagrantfile?? at least port forward stuff.

### Pause / unpause vagrant

- ``vagrant suspend``
- ``vagrant resume``

---

## Directus DB import / export

Run these commands in ``/backend/development``

### Export database

``.\backup-directus export``

This dumps directus Postgresql and saves the dump in project root

### Import database

WARNING: This deletes existing data in ``directus_data_dev`` volume. It stops all services and once backup is imported,
starts them again.

``.\backup-directus import``

This uses the ``backup.sql`` from project root and runs it in the database.