#!/bin/python3.3

from os import chdir


CONKY_FILES = ['date',
               'sys',
               'temp',
               'hdd',
               'net'
               ]

print('Moving to `~/.conky/`.')
chdir('/home/georgi/.conky/')


def help_menu():
    help_m = ['? - show this help menu',
              'p - change conky\'s position',
              'd - change the default color',
              't - change the color of the titles',
              'c - change the color of the clock',
              'q - exit']

    return '\n'.join(help_m)


def change_position():
    x = int(input('x > '))
    y = int(input('y > '))

    for i in range(len(CONKY_FILES)):
        confing_file = open(CONKY_FILES[i], 'r')

        print('Reading {}.'.format(CONKY_FILES[i]))
        content = confing_file.read()
        content = content.splitlines()
        confing_file.close()

        for j in range(len(content)):
            if content[j][:5] == 'gap_x':
                print('Setting gap_x to {}.'.format(x * (i + 1)))
                content[j] = 'gap_x {}'.format(x * (i + 1))
            elif content[j][:5] == 'gap_y':
                print('Settint gap_y to {}.'.format(y))
                content[j] = 'gap_y {}'.format(y)

        print('Writing changes to {}.'.format(CONKY_FILES[i]))
        output_file = open(CONKY_FILES[i], 'w')
        output_file.write('\n'.join(content))
        output_file.close()

        print('Done.')


def change_default_color():
    new_color = input('new color > ')

    for i in range(len(CONKY_FILES)):
        confing_file = open(CONKY_FILES[i], 'r')

        print('Reading {}.'.format(CONKY_FILES[i]))
        content = confing_file.read()
        content = content.splitlines()
        confing_file.close()

        for j in range(len(content)):
            if content[j][:13] == 'default_color':
                print('Setting default color to {}.'.format(new_color))
                content[j] = 'default_color {}'.format(new_color)

        print('Writing changes to {}.'.format(CONKY_FILES[i]))
        output_file = open(CONKY_FILES[i], 'w')
        output_file.write('\n'.join(content))
        output_file.close()

        print('Done.')


def change_titles_color():
    new_color = input('new color > ')

    for i in range(len(CONKY_FILES)):
        confing_file = open(CONKY_FILES[i], 'r')

        print('Reading {}.'.format(CONKY_FILES[i]))
        content = confing_file.read()
        content = content.splitlines()
        confing_file.close()

        for j in range(len(content)):
            if content[j][:6] == 'color1':
                print('Setting titles color to {}.'.format(new_color))
                content[j] = 'color1 {}'.format(new_color)

        print('Writing changes to {}.'.format(CONKY_FILES[i]))
        output_file = open(CONKY_FILES[i], 'w')
        output_file.write('\n'.join(content))
        output_file.close()

        print('Done.')


def change_clock_color():
    new_color = input('new color > ')

    for i in range(len(CONKY_FILES)):
        confing_file = open(CONKY_FILES[i], 'r')

        print('Reading {}.'.format(CONKY_FILES[i]))
        content = confing_file.read()
        content = content.splitlines()
        confing_file.close()

        for j in range(len(content)):
            if content[j][:6] == 'color2':
                print('Setting titles color to {}.'.format(new_color))
                content[j] = 'color2 {}'.format(new_color)

        print('Writing changes to {}.'.format(CONKY_FILES[i]))
        output_file = open(CONKY_FILES[i], 'w')
        output_file.write('\n'.join(content))
        output_file.close()

        print('Done.')


def main():
    while True:
        command = input('> ')

        if command == '?':
            print(help_menu())
        elif command == 'p':
            change_position()
        elif command == 'd':
            change_default_color()
        elif command == 't':
            change_titles_color()
        elif command == 'c':
            change_clock_color()
        elif command == 'q':
            break
        else:
            print('Unknown command.')


if __name__ == '__main__':
    main()
