Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7E62D725
	for <lists+nouveau@lfdr.de>; Wed, 29 May 2019 09:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE6E6E299;
	Wed, 29 May 2019 07:58:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9987D6E294
 for <nouveau@lists.freedesktop.org>; Wed, 29 May 2019 07:58:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 961B672167; Wed, 29 May 2019 07:58:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Wed, 29 May 2019 07:58:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ak@axet.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-110660-8800-hA1kpJ6LZT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110660-8800@http.bugs.freedesktop.org/>
References: <bug-110660-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 110660] GeForce GT 750M Mac Edition fullscreen issues
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
Content-Type: multipart/mixed; boundary="===============0421017976=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0421017976==
Content-Type: multipart/alternative; boundary="15591167211.69f2AD4D.21351"
Content-Transfer-Encoding: 7bit


--15591167211.69f2AD4D.21351
Date: Wed, 29 May 2019 07:58:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110660

Alexey Kuznetsov <ak@axet.ru> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144370|0                           |1
        is obsolete|                            |

--- Comment #39 from Alexey Kuznetsov <ak@axet.ru> ---
Created attachment 144371
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144371&action=3Dedit
drm.debug dmesg-mode.log

Reupload with log_buf_len=3D1M. During this session it hangs during mode
switching, rare black/static screen. I switch to linux console (alt f1) took
log and switch back. Unusual, but it is restored with:

720x400
640x400
Failed to change the screen configuration!
640x350
Failed to change the screen configuration!
Failed to change the screen configuration!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591167211.69f2AD4D.21351
Date: Wed, 29 May 2019 07:58:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ak&#64;ax=
et.ru" title=3D"Alexey Kuznetsov &lt;ak&#64;axet.ru&gt;"> <span class=3D"fn=
">Alexey Kuznetsov</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144370 is obsolete</=
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
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660#c39">Comme=
nt # 39</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GeForce GT 750M Mac Edition fullscreen issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110660">bug 11066=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ak&#64;axet.ru" title=3D"Alexey Kuznetsov &lt;ak&#64;axet.ru&gt;"> <span cl=
ass=3D"fn">Alexey Kuznetsov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144371=
" name=3D"attach_144371" title=3D"drm.debug dmesg-mode.log">attachment 1443=
71</a> <a href=3D"attachment.cgi?id=3D144371&amp;action=3Dedit" title=3D"dr=
m.debug dmesg-mode.log">[details]</a></span>
drm.debug dmesg-mode.log

Reupload with log_buf_len=3D1M. During this session it hangs during mode
switching, rare black/static screen. I switch to linux console (alt f1) took
log and switch back. Unusual, but it is restored with:

720x400
640x400
Failed to change the screen configuration!
640x350
Failed to change the screen configuration!
Failed to change the screen configuration!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591167211.69f2AD4D.21351--

--===============0421017976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0421017976==--
