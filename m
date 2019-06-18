Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F07FE4965E
	for <lists+nouveau@lfdr.de>; Tue, 18 Jun 2019 02:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC1C6E0BE;
	Tue, 18 Jun 2019 00:43:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF1DE6E0B9
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2019 00:43:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC24A72167; Tue, 18 Jun 2019 00:43:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Tue, 18 Jun 2019 00:43:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: taranov.andrey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110931-8800-cRgDaw9VMU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110931-8800@http.bugs.freedesktop.org/>
References: <bug-110931-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110931] Timeout initializing Falcon after cold boot
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
Content-Type: multipart/mixed; boundary="===============0276191006=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0276191006==
Content-Type: multipart/alternative; boundary="15608185960.1B4F5.19323"
Content-Transfer-Encoding: 7bit


--15608185960.1B4F5.19323
Date: Tue, 18 Jun 2019 00:43:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110931

Andrey Taranov <taranov.andrey@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144579|0                           |1
        is obsolete|                            |

--- Comment #1 from Andrey Taranov <taranov.andrey@gmail.com> ---
Created attachment 144580
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144580&action=3Dedit
Failing kernel log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15608185960.1B4F5.19323
Date: Tue, 18 Jun 2019 00:43:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:taranov.a=
ndrey&#64;gmail.com" title=3D"Andrey Taranov &lt;taranov.andrey&#64;gmail.c=
om&gt;"> <span class=3D"fn">Andrey Taranov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931">bug 11093=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144579 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Timeout initializing Falcon after cold boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110931">bug 11093=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
taranov.andrey&#64;gmail.com" title=3D"Andrey Taranov &lt;taranov.andrey&#6=
4;gmail.com&gt;"> <span class=3D"fn">Andrey Taranov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144580=
" name=3D"attach_144580" title=3D"Failing kernel log">attachment 144580</a>=
 <a href=3D"attachment.cgi?id=3D144580&amp;action=3Dedit" title=3D"Failing =
kernel log">[details]</a></span>
Failing kernel log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15608185960.1B4F5.19323--

--===============0276191006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0276191006==--
