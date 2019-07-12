Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8366B93
	for <lists+nouveau@lfdr.de>; Fri, 12 Jul 2019 13:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797D76E356;
	Fri, 12 Jul 2019 11:26:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D0596E35D
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2019 11:26:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4605272167; Fri, 12 Jul 2019 11:26:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Fri, 12 Jul 2019 11:26:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: pdraganov@taxback.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110714-8800-i3jpqcx4zT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110714-8800@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110714] Xorg crashes randomly because of memory leak
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
Content-Type: multipart/mixed; boundary="===============0480253973=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0480253973==
Content-Type: multipart/alternative; boundary="15629307780.6E2F8a.12831"
Content-Transfer-Encoding: 7bit


--15629307780.6E2F8a.12831
Date: Fri, 12 Jul 2019 11:26:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #13 from Peter Draganov <pdraganov@taxback.com> ---
After nearly 1 day and 3 hours:
xrestop - Display: localhost:0
          HMonitoring 51 clients. XErrors: 0
          Pixmaps: 1180312K total, Other:     221K total, All: 1180534K tot=
al

res-base Wins  GCs Fnts Pxms Misc   Pxm mem  Other   Total   PID Identifier=
=20=20=20=20
6200000   227    4    1 1242 1801   800547K     48K 800596K  9592 Linux1.od=
s -
LibreOffice Calc
0c00000    43    4    2   94 4175   204916K    100K 205017K  2275 marco
3200000   106   74    1   86  325   117024K     12K 117037K  3072 phpPgAdmi=
n -
Mozilla Firefox
5a00000    17    3    1    6   81    17307K      3K  17310K  3891
pdraganov@bgva-f-00:~
1000000     8    3    1   27   59    10417K      2K  10420K  2303
x-caja-desktop
4600000    30    2    1    3   93     9990K      3K   9993K  3008 7 [Runnin=
g] -
Oracle VM VirtualBox
3e00000     2    1    0    3   28     9400K    744B   9401K   ?   <unknown>
0000000     2    0    2    0  277     3413K      8K   3421K   ?   <unknown>
6000000     0    0    0    1    0     3413K      0B   3413K   ?   <unknown>

Probably LibreOffice is the problem? I have 18 documents opened at the mome=
nt.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629307780.6E2F8a.12831
Date: Fri, 12 Jul 2019 11:26:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pdraganov&#64;taxback.com" title=3D"Peter Draganov &lt;pdraganov&#64;taxbac=
k.com&gt;"> <span class=3D"fn">Peter Draganov</span></a>
</span></b>
        <pre>After nearly 1 day and 3 hours:
xrestop - Display: localhost:0
          HMonitoring 51 clients. XErrors: 0
          Pixmaps: 1180312K total, Other:     221K total, All: 1180534K tot=
al

res-base Wins  GCs Fnts Pxms Misc   Pxm mem  Other   Total   PID Identifier=
=20=20=20=20
6200000   227    4    1 1242 1801   800547K     48K 800596K  9592 Linux1.od=
s -
LibreOffice Calc
0c00000    43    4    2   94 4175   204916K    100K 205017K  2275 marco
3200000   106   74    1   86  325   117024K     12K 117037K  3072 phpPgAdmi=
n -
Mozilla Firefox
5a00000    17    3    1    6   81    17307K      3K  17310K  3891
pdraganov&#64;bgva-f-00:~
1000000     8    3    1   27   59    10417K      2K  10420K  2303
x-caja-desktop
4600000    30    2    1    3   93     9990K      3K   9993K  3008 7 [Runnin=
g] -
Oracle VM VirtualBox
3e00000     2    1    0    3   28     9400K    744B   9401K   ?   &lt;unkno=
wn&gt;
0000000     2    0    2    0  277     3413K      8K   3421K   ?   &lt;unkno=
wn&gt;
6000000     0    0    0    1    0     3413K      0B   3413K   ?   &lt;unkno=
wn&gt;

Probably LibreOffice is the problem? I have 18 documents opened at the mome=
nt.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629307780.6E2F8a.12831--

--===============0480253973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0480253973==--
