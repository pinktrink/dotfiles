import os, sys


class D:
    dlist = []

    def __init__(self):
        try:
            with open(os.environ['HOME'] + '/.dlist') as f:
                self.dlist = [line.strip() for line in open(os.environ['HOME'] + '/.dlist')]
        except IOError:
            pass

    def wrt(self):
        with open(os.environ['HOME'] + '/.dlist', 'w+') as f:
            for i in self.dlist:
                if i != '':
                    f.write("%s\n" % i)

    def add(self, dr):
        if dr == None:
            dr = os.getcwd()

        if dr in self.dlist:
            return

        self.dlist.append(dr)

        self.wrt()

    def rem(self, num):
        if num == None:
            del self.dlist[-1]
        else:
            del self.dlist[num]

        self.wrt()

    def lst(self):
        it = 0

        for i in self.dlist:
            if i == os.getcwd():
                i = i + ' *'

            print str(it) + ': ' + i.replace(os.environ['HOME'], '~')

            it += 1

    def go(self, num):
        print self.dlist[num]

if __name__ == '__main__':
    d = D()

    try:
        cmd = sys.argv[1]

        if cmd == '+':
            dr = None
            num = None

            try:
                dr = sys.argv[2]
            except IndexError:
                pass
            finally:
                d.add(dr)
                d.lst()
        elif cmd == '-':
            num = None

            try:
                num = int(sys.argv[2])
            except IndexError:
                pass
            finally:
                d.rem(num)
                d.lst()
        else:
            try:
                num = int(sys.argv[1])

                d.go(num)
            except:
                print 'Usage:'
                print '    d + [dir]:'
                print '        Add a directory. If dir is not present, the'
                print '        current directory is assumed.'
                print
                print '    d - [num]:'
                print '        Removes the element indexed with num from the'
                print '        list. If num is not specified, it removes the'
                print '        last element from the list.'
                print
                print '    d num:'
                print '        Goes to the directory at index num.'
                print
                print '    d:'
                print '        Displays the directory list.'

                exit(1)
    except IndexError:
        d.lst()
