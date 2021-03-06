grub2 maintainers: https://savannah.gnu.org/project/memberlist.php?detailed=1&group=grub&boxoptionwanted=1#options

grub-install.exe can be downloaded from **grub-2.02~rc2-for-windows.zip** [ftp://alpha.gnu.org/gnu/grub/](url)

```
grub-install.exe  --boot-directory="F:\." --target="i386-pc" "\\?\F:" --force
Installing for i386-pc platform.
grub-install.exe: warning: File system `fat' doesn't support embedding.
grub-install.exe: warning: Embedding is not possible.  GRUB can only be installed in this setup by using blocklists.  Ho
wever, blocklists are UNRELIABLE and their use is discouraged..

```

## What are blocklists and why they are considered unreliable?

<blockquote>
<b>13.3 How to specify block lists</b>


A block list is used for specifying a file that doesn’t appear in the filesystem, like a chainloader. The syntax is [offset]+length[,[offset]+length]…. Here is an example:


0+100,200+1,300+300
This represents that GRUB should read blocks 0 through 99, block 200, and blocks 300 through 599. If you omit an offset, then GRUB assumes the offset is zero.


Like the file name syntax (see File name syntax), if a blocklist does not contain a device name, then GRUB uses GRUB’s root device. So (hd0,2)+1 is the same as +1 when the root device is ‘(hd0,2)’.

</blockquote>

https://www.gnu.org/software/grub/manual/grub/html_node/Block-list-syntax.html#Block-list-syntax

https://askubuntu.com/questions/143418/what-are-blocklists-and-why-are-they-considered-unreliable

## Filesystems that only installs with blocklists have value of 1.

The Source Code was obtained through Anonymous clone using git client. https://savannah.gnu.org/git/?group=grub
* <code>git clone https://git.savannah.gnu.org/git/grub.git</code>

<pre><code>
Search "blocklist_install" (24 hits in 24 files)
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\affs</b>.c (1 hit)
	Line 697:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\bfs</b>.c (1 hit)
	Line 1095:   .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\btrfs</b>.c (1 hit)
	Line 1763:   .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\cbfs</b>.c (1 hit)
	Line 384:   .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\cpio_common</b>.c (1 hit)
	Line 242:   .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\ext2</b>.c (1 hit)
	Line 1084:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\f2fs</b>.c (1 hit)
	Line 1300:   .blocklist_install     = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\fat</b>.c (1 hit)
	Line 1245:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\hfs</b>.c (1 hit)
	Line 1429:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\hfsplus</b>.c (1 hit)
	Line 1090:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\iso9660</b>.c (1 hit)
	Line 1111:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\jfs</b>.c (1 hit)
	Line 941:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\minix</b>.c (1 hit)
	Line 696:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\nilfs2</b>.c (1 hit)
	Line 1204:   .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\ntfs</b>.c (1 hit)
	Line 1223:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\reiserfs</b>.c (1 hit)
	Line 1413:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\romfs</b>.c (1 hit)
	Line 471:     .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\sfs</b>.c (1 hit)
	Line 751:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\squash4</b>.c (1 hit)
	Line 1005:     .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\tar</b>.c (1 hit)
	Line 333:   .blocklist_install = 0,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\udf</b>.c (1 hit)
	Line 1356:   .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\ufs</b>.c (1 hit)
	Line 887:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\xfs</b>.c (1 hit)
	Line 1148:     .blocklist_install = 1,
  C:\Users\username\Desktop\grub2\grub\grub-core\fs<b>\zfs\zfs</b>.c (1 hit)
	Line 4361:   .blocklist_install = 0,
</code></pre>

To highlight all filesystem names in this markdown document: RegEx and Notepad++ were used.
* <b>Find</b> fs(\\.+)\.c
* <b>Replace</b> fs<b>\1</b>.c
