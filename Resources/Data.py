from faker import Faker
fake = Faker()



# Config data
class   Config:
    url = "https://dev.allweb.com.kh/rms"
    browser = "Chrome"
    username = "porhong"
    password = "123"

# Generate data
address = fake.address()
username_gen = fake.last_name()
lastname_gen = fake.last_name()
firstname_gen = fake.first_name()
password_gen = fake.password()
password_num_gen = fake.msisdn()
description_gen = fake.text(max_nb_chars=255)
job_gen = fake.job()
company_gen = fake.company()
email_gen = fake.email()


# Local data
dashbord_title = "ALLWEB Recruitment Management System"
print(email_gen)