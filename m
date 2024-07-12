Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF4192FA45
	for <lists+nouveau@lfdr.de>; Fri, 12 Jul 2024 14:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D75610ECED;
	Fri, 12 Jul 2024 12:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hZkgAFqT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3006510ECED
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2024 12:28:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so4544811a12.1
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2024 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720787288; x=1721392088; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7mdwrgChLjt237aeGZdoYoch5wUUhOyHuVEarZ9v0kU=;
 b=hZkgAFqTZR7aEl7FDr3skvN7Rl9irkz5qbLVcaOK0lZC+J0vqByPzmFkogQi8qur9A
 xCPDvFjzNvdJNoPQIQU6rjJfKEWf92Xf3607aHopuFe9MqAok2HLvBCXDbnqtBIKqUKR
 Jk+5EBYwnJkjatUAlOI3h/8neMS6M1ckg7Yv0U4fIeccGOaTk7ISinCvpppgI3MMEgcV
 qlvrWm5TrRThD7SjEaKPsaMAq8Yi0BtvqvDmOAiiqGpXn4Ycwc6RYts/lRUGAyXD5gwP
 h/nX1rNoDUszqWuyjrNa1QHhp7RGuA/xZopGlR4zQ79t+BWaQc3X5BrTDNrFBRjO+BHk
 k3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720787288; x=1721392088;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7mdwrgChLjt237aeGZdoYoch5wUUhOyHuVEarZ9v0kU=;
 b=jYN/di9AH+DTQryiPG6x7397iGM4VRu4pCR3Wl+vCyLHDvwXkfe09UugKn5YlJ6GvN
 hSO7MRSJxuaaIcDaXwElIih0fZEbtMM/PNVm6AnLuw4RZo+5Y9RCUG5ypkIXEEQ2OqK/
 o66QQuLh/TDUTAq/gVHhnO6AJWqv3sKx+Xl9fLRoxMACBsfl8jbva8hi+8jbUSlCL3qg
 YSSuzlikOdoCBZhA7m/QTf4xD9JiZQKUBBi9KhjgftQSKWjuKeDHBf5YxoSD1+FI9Dqx
 jS8KhK3dV33nupMYNWWOy6wDILNwk8ZEBqDsgTPC+FvB+lJ3wsE5TF0+Zz1bxLw2Jf63
 y9ew==
X-Gm-Message-State: AOJu0Yy2TEiKPW4k4SU6gVHjnQOsC06Cxt3d2jpXz73CTKQDfsHCRyO1
 wf+MItEGR0cglFosSDRbrrkpnUr3lJDdXHP3ce/qrqm0BEE4fk+HxF5Jkt2CwR2YEWwxI3246nk
 DeFKYIEkM1nggaTRQrIIU1OddUJPcUzMMw0c=
X-Google-Smtp-Source: AGHT+IHqE1Edi1TGwh4vP2ba5W42BwDXnIM2Bl/IMKK0Z9gSeQy0sRtWgXsXtMrlocdzsTGsB2jrRKJEagZFalar9rU=
X-Received: by 2002:a05:6402:50cc:b0:585:9e73:8ac6 with SMTP id
 4fb4d7f45d1cf-59964ac31f1mr2077536a12.16.1720787287908; Fri, 12 Jul 2024
 05:28:07 -0700 (PDT)
MIME-Version: 1.0
From: Tiaan Wessels <tiaanwessels@gmail.com>
Date: Fri, 12 Jul 2024 12:27:56 +0000
Message-ID: <CALGm=8H4fUBVb+=aBpN-BMbwBY4_+cc68fcJbJ4e0ok-uKRcNw@mail.gmail.com>
Subject: RHEL9.2 Desktop Freeze
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000007ad96061d0c03fb"
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

--00000000000007ad96061d0c03fb
Content-Type: text/plain; charset="UTF-8"

Hi,
I have some HP Z2's running RedHat EL9.2 with NVIDIA Corporation TU117GL
[T1000 8GB] (rev a1) in them. I use the Nouveau driver instead of the
proprietary one. I get it that these workstations freeze at times to the
extent that no keyboard or mouse input works and display output is stalled.
When this happens I've sometimes observed spin lock errors in the logs in
the vicinity of the time when this happens. I've tried sticking my head in
the sand and disabled spin lock detection in the kernel at boot with no
avail. It still freezes, only there is no more spin lock related logs.
The logs that i do get at the time are thousands of:
Jul  8 14:22:28 termcli3 kernel: nouveau 0000:01:00.0: fifo: PBDMA0:
80000000 [] ch 2 00003f50 e3b6a00a
holding on for a couple of minutes and then thousands of
Jul  8 14:25:38 termcli3 systemd-journald[272688]: Missed 2 kernel messages
Jul  8 14:25:38 termcli3 kernel: nouveau 0000:01:00.0: fifo: PBDMA0:
80000000 [] ch 2 00003f50 e3b6a00a
and from thereon i need to power cycle to get out of it
Is this perhaps a known problem ?
Thanks

--00000000000007ad96061d0c03fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div=
>I have some HP Z2&#39;s running RedHat EL9.2 with NVIDIA Corporation TU117=
GL [T1000 8GB] (rev a1) in them. I use the Nouveau driver instead of the pr=
oprietary one. I get it that these workstations freeze at times to the exte=
nt that no keyboard or mouse input works and display output is stalled. Whe=
n this happens I&#39;ve sometimes observed spin lock errors in the logs in =
the vicinity of the time when this happens. I&#39;ve tried sticking my head=
 in the sand and disabled spin lock detection in the kernel at boot with no=
 avail. It still freezes, only there is no more spin lock related logs.</di=
v><div>The logs that i do get at the time are thousands of:</div><div><div>=
Jul=C2=A0 8 14:22:28 termcli3 kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 8=
0000000 [] ch 2 00003f50 e3b6a00a</div></div><div>holding on for a couple o=
f minutes and then thousands of</div><div><div>Jul=C2=A0 8 14:25:38 termcli=
3 systemd-journald[272688]: Missed 2 kernel messages</div><div>Jul=C2=A0 8 =
14:25:38 termcli3 kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 80000000 [] c=
h 2 00003f50 e3b6a00a</div></div><div>and from thereon i need to power cycl=
e to get out of it</div><div>Is this perhaps a known problem ?</div><div>Th=
anks</div><div><br></div><div><br></div></div></div></div></div>

--00000000000007ad96061d0c03fb--
