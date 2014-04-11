#!/bin/python3.4
import imaplib
from localconfig import USERNAME, PASSWORD


mail = imaplib.IMAP4_SSL('imap.gmail.com')
mail.login(USERNAME, PASSWORD)


def get_unseen_emails_number():
    mail.list()
    mail.select('INBOX')

    result, data = mail.search(None, 'UNSEEN')
    if result != 'OK':
        print('error')
        return

    ids = data[0]
    id_list = ids.split()

    return len(id_list)


def peek_unseen_emails():
    pass


def main():
    new_mails = get_unseen_emails_number()

    if new_mails == 0:
        print('There are no new emails!')
        return

    print('There are {} new emails.'.format(new_mails))

    mail.close()


if __name__ == '__main__':
    main()
