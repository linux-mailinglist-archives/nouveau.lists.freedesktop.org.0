Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060D1B2B3
	for <lists+nouveau@lfdr.de>; Mon, 13 May 2019 11:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A128C8982E;
	Mon, 13 May 2019 09:17:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E978E8982E
 for <nouveau@lists.freedesktop.org>; Mon, 13 May 2019 09:17:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E0130721CD; Mon, 13 May 2019 09:17:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Mon, 13 May 2019 09:17:25 +0000
X-Bugzilla-Reason: QAcontact AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/nouveau
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sjon@hortensius.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-110669-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110669] New: iMac with GK107M unstable - hangs with
 xorg / crashes with xwayland
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0729154217=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0729154217==
Content-Type: multipart/alternative; boundary="15577390440.E92E8.11710"
Content-Transfer-Encoding: 7bit


--15577390440.E92E8.11710
Date: Mon, 13 May 2019 09:17:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110669

            Bug ID: 110669
           Summary: iMac with GK107M unstable - hangs with xorg / crashes
                    with xwayland
           Product: Mesa
           Version: 19.0
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau@lists.freedesktop.org
          Reporter: sjon@hortensius.net
        QA Contact: nouveau@lists.freedesktop.org

I'd like to start with noting this issue has been occurring for years on mo=
st
of our iMacs and I strongly suspect this isn't necessarily "caused" by nouv=
eau
but rather by an implementation detail NVidia forgot to document (please re=
mind
me why I keep buying their hardware?)

Hardware: Apple Inc. iMac13,2/Mac-FC02E91DDD3FA6A4, BIOS
IM131.88Z.010A.B05.1211151146 11/15/2012
Software: Archlinux / any nouveau release, currenty running xf86-video-nouv=
eau
1.0.16-1

Using Xorg this iMac hangs maybe 2 or 3 times a day, using Xwayland (using
sway, a native wayland implementation) there actually is a backtrace and I =
have
a chance to reboot instead of kill the power. I'd love to help debug this s=
ince
I assume it only happens when using this specific hardware. To start with -
here is a backtrace:

Stack trace of thread 765:
#0  0x00007f9374fe282f raise (libc.so.6)
#1  0x00007f9374fcd672 abort (libc.so.6)
#2  0x000055ef04386f6a n/a (Xwayland)
#3  0x000055ef0437f645 n/a (Xwayland)
#4  0x000055ef0438a7a6 n/a (Xwayland)
#5  0x00007f9374fe28b0 __restore_rt (libc.so.6)
#6  0x00007f9374fe282f raise (libc.so.6)
#7  0x00007f9374fcd672 abort (libc.so.6)
#8  0x00007f9375024e78 __libc_message (libc.so.6)
#9  0x00007f937502b78a malloc_printerr (libc.so.6)
#10 0x00007f937502d007 _int_free (libc.so.6)
#11 0x00007f936e02b7da nouveau_bo_ref (libdrm_nouveau.so.2)
#12 0x00007f9372866894 n/a (nouveau_dri.so)
#13 0x00007f9372a14c87 n/a (nouveau_dri.so)
#14 0x00007f93729d6604 n/a (nouveau_dri.so)
#15 0x00007f93729d9031 n/a (nouveau_dri.so)
#16 0x00007f93729dc5c8 n/a (nouveau_dri.so)
#17 0x000055ef0448d8d4 n/a (Xwayland)
#18 0x000055ef0449963d n/a (Xwayland)
#19 0x000055ef04404ec1 n/a (Xwayland)
#20 0x000055ef043e53c8 n/a (Xwayland)
#21 0x000055ef043e5933 n/a (Xwayland)
#22 0x000055ef04451270 n/a (Xwayland)
#23 0x000055ef0434b11d n/a (Xwayland)
#24 0x00007f9374fcece3 __libc_start_main (libc.so.6)
#25 0x000055ef0434c14e n/a (Xwayland)

Stack trace of thread 769:
#0  0x00007f93746f2bac pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 771:
#0  0x00007f93746f2bac pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 772:
#0  0x00007f93746f2bac pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 768:
#0  0x00007f93746f2bac pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f9372cc81e4 n/a (nouveau_dri.so)
#2  0x00007f9372cc7f08 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 770:
#0  0x00007f93746f2bac pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15577390440.E92E8.11710
Date: Mon, 13 May 2019 09:17:24 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - iMac with GK107M unstable - hangs with xorg / crashes wit=
h xwayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110669">110669</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>iMac with GK107M unstable - hangs with xorg / crashes with xw=
ayland
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.0
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>sjon&#64;hortensius.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'd like to start with noting this issue has been occurring fo=
r years on most
of our iMacs and I strongly suspect this isn't necessarily &quot;caused&quo=
t; by nouveau
but rather by an implementation detail NVidia forgot to document (please re=
mind
me why I keep buying their hardware?)

Hardware: Apple Inc. iMac13,2/Mac-FC02E91DDD3FA6A4, BIOS
IM131.88Z.010A.B05.1211151146 11/15/2012
Software: Archlinux / any nouveau release, currenty running xf86-video-nouv=
eau
1.0.16-1

Using Xorg this iMac hangs maybe 2 or 3 times a day, using Xwayland (using
sway, a native wayland implementation) there actually is a backtrace and I =
have
a chance to reboot instead of kill the power. I'd love to help debug this s=
ince
I assume it only happens when using this specific hardware. To start with -
here is a backtrace:

Stack trace of thread 765:
#0  0x00007f9374fe282f raise (libc.so.6)
#1  0x00007f9374fcd672 abort (libc.so.6)
#2  0x000055ef04386f6a n/a (Xwayland)
#3  0x000055ef0437f645 n/a (Xwayland)
#4  0x000055ef0438a7a6 n/a (Xwayland)
#5  0x00007f9374fe28b0 __restore_rt (libc.so.6)
#6  0x00007f9374fe282f raise (libc.so.6)
#7  0x00007f9374fcd672 abort (libc.so.6)
#8  0x00007f9375024e78 __libc_message (libc.so.6)
#9  0x00007f937502b78a malloc_printerr (libc.so.6)
#10 0x00007f937502d007 _int_free (libc.so.6)
#11 0x00007f936e02b7da nouveau_bo_ref (libdrm_nouveau.so.2)
#12 0x00007f9372866894 n/a (nouveau_dri.so)
#13 0x00007f9372a14c87 n/a (nouveau_dri.so)
#14 0x00007f93729d6604 n/a (nouveau_dri.so)
#15 0x00007f93729d9031 n/a (nouveau_dri.so)
#16 0x00007f93729dc5c8 n/a (nouveau_dri.so)
#17 0x000055ef0448d8d4 n/a (Xwayland)
#18 0x000055ef0449963d n/a (Xwayland)
#19 0x000055ef04404ec1 n/a (Xwayland)
#20 0x000055ef043e53c8 n/a (Xwayland)
#21 0x000055ef043e5933 n/a (Xwayland)
#22 0x000055ef04451270 n/a (Xwayland)
#23 0x000055ef0434b11d n/a (Xwayland)
#24 0x00007f9374fcece3 __libc_start_main (libc.so.6)
#25 0x000055ef0434c14e n/a (Xwayland)

Stack trace of thread 769:
#0  0x00007f93746f2bac pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 771:
#0  0x00007f93746f2bac pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 772:
#0  0x00007f93746f2bac pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 768:
#0  0x00007f93746f2bac pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f9372cc81e4 n/a (nouveau_dri.so)
#2  0x00007f9372cc7f08 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)

Stack trace of thread 770:
#0  0x00007f93746f2bac pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f9372687474 n/a (nouveau_dri.so)
#2  0x00007f93726872c8 n/a (nouveau_dri.so)
#3  0x00007f93746eca92 start_thread (libpthread.so.0)
#4  0x00007f93750a5cd3 __clone (libc.so.6)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577390440.E92E8.11710--

--===============0729154217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0729154217==--
