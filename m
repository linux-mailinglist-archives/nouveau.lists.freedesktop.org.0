Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F618C1821
	for <lists+nouveau@lfdr.de>; Thu,  9 May 2024 23:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7339810F472;
	Thu,  9 May 2024 21:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y+7TxKDg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179D710F472
 for <nouveau@lists.freedesktop.org>; Thu,  9 May 2024 21:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715289113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kHA6/aeevN+iRF1+w07RanccRf9FAorS/DmVI5C2io=;
 b=Y+7TxKDgv8qw3I8lvDKXO8Iln3gIG/lczq0DvfG0QwfYC6a+qoa21+OqyiHeT85SePdNms
 x/cWcHYjXnhEJ70o9h7DJb8F9R3VGe90tCMnlO5wCyUhwgKgczUih80/HPqS464FA3kA5d
 3jQ/6RXqKP2W3v9WuCgX3ejsWrbRMmY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-wiQUpdgOMYOkSFvFqiCmyQ-1; Thu, 09 May 2024 17:11:52 -0400
X-MC-Unique: wiQUpdgOMYOkSFvFqiCmyQ-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6f4739ba7dcso910574b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 09 May 2024 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715289111; x=1715893911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2kHA6/aeevN+iRF1+w07RanccRf9FAorS/DmVI5C2io=;
 b=dmU0QVNpuqTbeLpYJVOxdShglkUGuTAJ/cOdRGk2eon88TcrZ31Za6+yWrVaJMIcK5
 NeE7EJ6i2atMckEiJtycUziX3q7kr8rzSnuArv5jK24D8vc6pOrbbYKO9U1ug1LmqcAN
 P15uHTVYzLFhTBO/OYC2SvD06aNU2BBstu3eqspTIAus0HeWtLwJSAi5Pu8Ih+DWcTPd
 4oy7MnVtboJVVg8o3fR+5/+ENufDMTxQjtdbASIP0NlG7blJV3KCrc727EmQh/TOjn2M
 N+IFdvl21USpsyN5it7J8g3RTVI4CTMkTC9FbyhBlxE8nRLdojtK5r0qEnD6WrzezW7k
 8MYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhr6Ym/EaJRGRjm6WQqUGXiKlI8yeojLe+fU36XxJsr565R6QFYEouZ1NR+obQKyDBgek1Pe7yyc+KvswtX/jj+8pcTwfoEM6XMeZbsg==
X-Gm-Message-State: AOJu0YzKG7XHHLJuFKrt5gux9qUayHbrjJL0EujSDGE0mZajGV/mvJUC
 as6iY6a+JmDLcc80LlESqq7lVmB5KmJbTuAiTvzEXHnrIaFRmB0L76NBilkRX/05oG7BdUeyILl
 XoEKFZOOgfVUgt6pw/QZzSX/TfBhCdghjxn17gUiDvwCcIv2JMAMvsZtr4VSp1WMJD6PLsAgCfn
 IEHVV+Z2vWB7Fjkoes5DaAk1U2P4vyDqWdk7Lm0A==
X-Received: by 2002:a05:6a00:9285:b0:6e6:98bf:7b62 with SMTP id
 d2e1a72fcca58-6f4e02ac4cdmr745596b3a.8.1715289111133; 
 Thu, 09 May 2024 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOeAuLy32ezsJj2r1M7Hca10qZlE0XUfZZcm6MULvRBLOnlB/aFauj8MDw1aUvDiKiKEQTpiYrLQJPHEHvMxs=
X-Received: by 2002:a05:6a00:9285:b0:6e6:98bf:7b62 with SMTP id
 d2e1a72fcca58-6f4e02ac4cdmr745574b3a.8.1715289110746; Thu, 09 May 2024
 14:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240506182331.8076-1-dan@danm.net>
 <ba0bc464-a06a-4c54-945a-202dca2c4e49@leemhuis.info>
In-Reply-To: <ba0bc464-a06a-4c54-945a-202dca2c4e49@leemhuis.info>
From: David Airlie <airlied@redhat.com>
Date: Fri, 10 May 2024 07:11:39 +1000
Message-ID: <CAMwc25pJqmNwpRvD3-Ahf66_XB9yFMxhSvU=M4vBMdhVSYS3PQ@mail.gmail.com>
Subject: Re: [REGRESSION] v6.9-rc7: nouveau: init failed, no display output
 from kernel; successfully bisected
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lyude@redhat.com, kherbst@redhat.com, dakr@redhat.com, 
 stable@vger.kernel.org, Dan Moulding <dan@danm.net>,
 nouveau@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Thu, May 9, 2024 at 8:31=E2=80=AFPM Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> On 06.05.24 20:23, Dan Moulding wrote:
> > After upgrading to rc7 from rc6 on a system with NVIDIA GP104 using
> > the nouveau driver, I get no display output from the kernel (only the
> > output from GRUB shows on the primary display). Nonetheless, I was
> > able to SSH to the system and get the kernel log from dmesg. I found
> > errors from nouveau in it. Grepping it for nouveau gives me this:
> >
> > [    0.367379] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
> > [    0.474499] nouveau 0000:01:00.0: bios: version 86.04.50.80.13
> > [    0.474620] nouveau 0000:01:00.0: pmu: firmware unavailable
> > [    0.474977] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
> > [    0.484371] nouveau 0000:01:00.0: sec2(acr): mbox 00000001 00000000
> > [    0.484377] nouveau 0000:01:00.0: sec2(acr):load: boot failed: -5
> > [    0.484379] nouveau 0000:01:00.0: acr: init failed, -5
> > [    0.484466] nouveau 0000:01:00.0: init failed with -5
> > [    0.484468] nouveau: DRM-master:00000000:00000080: init failed with =
-5
> > [    0.484470] nouveau 0000:01:00.0: DRM-master: Device allocation fail=
ed: -5
> > [    0.485078] nouveau 0000:01:00.0: probe with driver nouveau failed w=
ith error -50
> >
> > I bisected between v6.9-rc6 and v6.9-rc7 and that identified commit
> > 52a6947bf576 ("drm/nouveau/firmware: Fix SG_DEBUG error with
> > nvkm_firmware_ctor()") as the first bad commit.
>
> Lyude, that's a commit of yours.
>
> Given that 6.9 is due a quick question: I assume there is no easy fix
> for this in sight? Or is a quick revert something that might be
> appropriate to prevent this from entering 6.9?

I'll take a look today and see if I can reproduce it and revert it if neede=
d.

Dave.

