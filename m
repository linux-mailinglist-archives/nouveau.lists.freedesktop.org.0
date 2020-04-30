Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05C51BEEF4
	for <lists+nouveau@lfdr.de>; Thu, 30 Apr 2020 06:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026486EB3A;
	Thu, 30 Apr 2020 04:15:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94A26EB3A
 for <nouveau@lists.freedesktop.org>; Thu, 30 Apr 2020 04:15:40 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id l25so2938264vso.6
 for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2020 21:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYwjuQDXeTiagLf9gQ+UdpaFBbTgS7NlqjgQ5NlRXVU=;
 b=rjyTtvciVN80vWYJPXX4sQEUhv4u20n0njXay5IDe6IphCD3DT/i2raeU4hnrYgluD
 +4j1YoVdKhRvGrOUQE1kNAbFIeC9xZ+BwUvJETNMripWHXtatIqVyrGtVUsVBAhFaFn2
 GU6MfV82YGLsURFax+nGT++TKEDRcbH9hkUH9qr2XTGHRsnVxLRp8qUcI5eU3qShGBx/
 U4oM5WU0fMOdIwIyJZuCfdeUPIKwbKiF2iL/8RMXozhHHiryQnQLE/wCSGpa1Jz+57nx
 gVkzligmX/Ech8iBXm8w0SYTk1nd6FTTn0WEsgC1OTluEC7sz5MW3Juwuhsw+MJtP4gT
 e8Kg==
X-Gm-Message-State: AGi0PubyCi7dZ4tzE4dOh8dYwDO67oac2AEC5XUvh359a0dO25gmqKCk
 c3tw/NuG4LD40WW7izgpRcDMLwiuzhShaBjxvL0=
X-Google-Smtp-Source: APiQypJxVhrqeeS9xG8C8mYI2CxlkKlm8BwVzWy4m4WA23mb0TjwqwaGKILmZO4Q/YC0iiMIW5AcnSZfkcb9/6J2vao=
X-Received: by 2002:a67:6955:: with SMTP id e82mr1476914vsc.18.1588220139817; 
 Wed, 29 Apr 2020 21:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200401185621.GA24692@avx2>
In-Reply-To: <20200401185621.GA24692@avx2>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 30 Apr 2020 00:15:28 -0400
Message-ID: <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [Nouveau] gp104: regression on Linux 5.6
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Alexey,

On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> gp104 refuses to switch to "graphic" mode and show anything past
> this line:
>
>         fb0: switching to nouveaufb from EFI VGA
>
> Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> normally.
>
> 5.5 is OK. 5.6 is broken.

I've heard some issues relating to missing firmware lately. It should
work fine without firmware, but perhaps that got broken. Can you log
into the machine and check dmesg to see what's there? My guess is that
nouveau takes over from efifb, and then fails to load at some point in
the middle.

> Bisecting is kinda painful with miscompilation and init/main.c breakage.
>
> BTW do I need all those megabytes of firmware?
>
> [    0.923273] fb0: switching to nouveaufb from EFI VGA
> [    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
> [    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
> [    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
> [    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx

This is necessary to provide any sort of acceleration. Otherwise this
is just a dumb scanout engine. You only need the firmware for your
chipset, not all of it.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
