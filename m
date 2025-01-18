Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FB6A15E79
	for <lists+nouveau@lfdr.de>; Sat, 18 Jan 2025 19:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E243F10E22A;
	Sat, 18 Jan 2025 18:25:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0376510E02A
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jan 2025 18:25:02 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a9c9b37244so55315005ab.1
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jan 2025 10:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737224702; x=1737829502;
 h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
 :date:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0HJ5W0kZMJIQYU70k9zjOsn00gywfDA+PBSDDRePKw=;
 b=bsPMgEEmybk3vxGlIZqkThuXu2xHT8ojazdJGQ8IzdYVcGl4b9jpYEdXcGdMDoo2EJ
 wS+P9m3ut9LVflxrXOhX7//VwHwi4kmBdG13ypPsZr4oEys/+Px9M7z3BIYQ+UjVfSJM
 2PgAAydW83A1zgieNfY3N8DNjvI+ETv+29VEUk46X1ds6SzBqU8RNXPA4KfAxpieZAEl
 ZNhvCMBH9S7M3aQ5hU6mv88d+nVejkADaOKKlK0WXslUhd9p5ofXIlkVjEJWhlmksW5b
 XLt3s+J7W+dch+buc3XiB4Si8O3xK3KYoetrbX9j2BI+VxmB1Ocl29AentuNqyOOnbPe
 FqiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsFO5u5wtQJMtNgTWNwt/xhqcy3Ei1kYuumoS6Du0IOECnJvlegVmjZ8dDhIEk6EOKdcOnTgGk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSqHmlitL1915epjsjJ3zkALk+WWn6+/WwbtiOig7JupL+aB6E
 BzAuI+viBAnM9v8mJGtQDwDbuz/HUMGtuy5yMzTxZ7wO6ajgyO1gmtL/hsOtse09IZe3+u1jsYG
 izI/qUAbg757f7R+59vxUV+h78Jtt1QBLcnPg+1DaHysrzFVo7gharY8=
X-Google-Smtp-Source: AGHT+IHH2UZ24a1vVSc4JnsX0rFy8xiob1jrG+ea8/xUTIzY/BFM7f7FTUMe1TTcaEfeS6i/dhKbK5rGu1tBCpusren4QEUxjOh3
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a8:b0:3ce:7cf3:27be with SMTP id
 e9e14a558f8ab-3cf743e096amr62226885ab.4.1737224702243; Sat, 18 Jan 2025
 10:25:02 -0800 (PST)
Date: Sat, 18 Jan 2025 10:25:02 -0800
In-Reply-To: <000000000000bf0b1f060a2d9bea@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <678bf1fe.050a0220.303755.002c.GAE@google.com>
Subject: Re: [syzbot] [dri?] divide error in drm_mode_debug_printmodeline
From: syzbot <syzbot+2e93e6fb36e6fdc56574@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, dakr@redhat.com, 
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, eadavis@qq.com, jani.nikula@intel.com, 
 jani.nikula@linux.intel.com, kherbst@redhat.com, linux-kernel@vger.kernel.org, 
 lizhi.xu@windriver.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com, 
 mazinalhaddad05@gmail.com, melissa.srw@gmail.com, mripard@kernel.org, 
 nouveau@lists.freedesktop.org, simona@ffwll.ch, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, 
 ville.syrjala@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

syzbot suspects this issue was fixed by commit:

commit 9398332f23fab10c5ec57c168b44e72997d6318e
Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
Date:   Fri Nov 29 04:26:28 2024 +0000

    drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D11797a185800=
00
start commit:   ac347a0655db Merge tag 'arm64-fixes' of git://git.kernel.o.=
.
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D88e7ba51eecd9cd=
6
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2e93e6fb36e6fdc56=
574
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11252f9768000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10fd2498e80000

If the result looks correct, please mark the issue as fixed by replying wit=
h:

#syz fix: drm/modes: Avoid divide by zero harder in drm_mode_vrefresh()

For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n
