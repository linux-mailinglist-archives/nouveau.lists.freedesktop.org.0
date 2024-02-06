Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD8E84BFD9
	for <lists+nouveau@lfdr.de>; Tue,  6 Feb 2024 23:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15CF10E6FA;
	Tue,  6 Feb 2024 22:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Wge5kC78";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D0A10E6CD
 for <nouveau@lists.freedesktop.org>; Tue,  6 Feb 2024 22:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707257625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oV38p0ChUDVFsbxCUF3CmIWxJt8WWKYIrHTwY79TP1s=;
 b=Wge5kC78CCezqXDmYv+KLn8r7kGo2xsEs5CQ2bzYC7pB/YiPl52WjQRP83HgU/CBhB3koh
 kBpne4CAHsXGYCKDWbU08UhuEiJAw1AGNCclC/m8CAWCCw99XavMRXXjexJkzvIUAfFPgS
 bCRbecOvQVEFNbht+/8lyuF3z78dvFM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-hufw8oLGP1e87ZKUhF7eug-1; Tue, 06 Feb 2024 17:13:44 -0500
X-MC-Unique: hufw8oLGP1e87ZKUhF7eug-1
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-6e12d22c2e3so1251003a34.1
 for <nouveau@lists.freedesktop.org>; Tue, 06 Feb 2024 14:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707257623; x=1707862423;
 h=mime-version:user-agent:content-transfer-encoding:organization:date
 :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=oV38p0ChUDVFsbxCUF3CmIWxJt8WWKYIrHTwY79TP1s=;
 b=HdnTg/2C4MBMPRAqCrRho+2+pcdp+RABsHPyWWiVmyasqvPav8JuXp1yzXOqh0mSuz
 ufZ9p6/Ir4zEHohRAviAw/YaW2KrzNXFAmcY4SOzQ9u1CfnHqwVubjLlYulD+8SQp6tp
 Sz1Jld+1Ri5+j3/PBwiNmqZaOIKBjltDE//eBzkpukiZJQZP3mc9MH3mAh9EoUwX9fWd
 yXCqmUginjGzw52JQ/KXlD87AMTeoHZ3MAtL3wDxDQxBYmj/rkq80HKz5bOzAM57TNz/
 64ziBSiGIULlROI8ieXCSFm/w5Ul8ugTo57sEswf6AP6U3d2GFv8rKSjO890FT3tzHN/
 g10g==
X-Gm-Message-State: AOJu0YxWee1a74QCtzi+ssndbKlPlA8156K6wEhCsb0WRwfdbbzBbA7L
 FiiUaJz5ij5dZgmCT0FJYZzJgnsRgUMdKwuk+/NWG/8DDb/+ypavR23GxnxHDTvg92C7Whb6cht
 +SKOEqLQH4GRPNuNGdU7kcVU6ifKT76sCPN4VYNpG3xJbEXuRqHbYxq6nQQmwVwGHWUyAjzI=
X-Received: by 2002:a05:6830:1395:b0:6dc:3dad:a540 with SMTP id
 d21-20020a056830139500b006dc3dada540mr4223793otq.36.1707257623248; 
 Tue, 06 Feb 2024 14:13:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUqH7ndIvYHGVn8LPUcMZX5DarQZKP9KJ6Tf9U6BoXFRFM4jZeRSt2Jx4weAJpnpJS9i17rg==
X-Received: by 2002:a05:6830:1395:b0:6dc:3dad:a540 with SMTP id
 d21-20020a056830139500b006dc3dada540mr4223780otq.36.1707257622909; 
 Tue, 06 Feb 2024 14:13:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVhux5Q1H8vnJKUYkTsUJD1bjl2TlPdmo6yYn9wd1MmTJ4Gtvi22bGl5Y4ujVvZSBLrXaDSzP4eMUaVzCYsOwk/8U7tDYFbVBbBw7BWwg==
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 g24-20020ac84b78000000b0042a25f3950esm1288220qts.75.2024.02.06.14.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 14:13:42 -0800 (PST)
Message-ID: <3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com>
Subject: Future of nouveau/nova's display driver, and rvkms introduction!
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Date: Tue, 06 Feb 2024 17:13:41 -0500
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
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

Hi everyone! As I'm sure a number of you are aware, since Nvidia's release =
of
the GSP firmware a lot of things have changed for nouveau. In particular, t=
he
interfaces which we use for controlling the hardware from nouveau have chan=
ged
pretty dramatically in many areas as a result of going through the GSP inst=
ead
of directly interfacing with various hardware registers. Enough so that at
least outside of modesetting, there isn't much potential for codesharing
between non-GSP devices and GSP devices.

As such a few folks at Red Hat, myself included, have been working on writi=
ng
up a new kernel driver intended solely for GSP devices known as nova:

https://gitlab.freedesktop.org/dakr/nova

As well, nova is a rust based driver - something we're hoping will become m=
uch
more common in the kernel as a result of this project (and the efforts of
other projects like Asahi!).

Of course, you'll notice I mentioned earlier that most of the GSP changes h=
ave
been outside of the area of modesetting. This is to say that while modesett=
ing
with nvidia hardware hasn't remained totally the same, it's mostly the same=
:
we've only had a small number of modesetting interfaces moved into the GSP,
and the evo/nvdisplay architecture remains largely identical to what it loo=
ked
like pre-GSP. This of course led us to the question of whether we should tr=
y
sharing a modesetting driver with nouveau, or if the effort of having a C
based modesetting driver alongside a rust counterpart would be too much wor=
k.

Eventually, while it would have been nice to have done code sharing here - =
we
ended up deciding that it probably would be more work then it's worth, and
that it wouldn't be a bad idea for us also to write up a new modesetting
driver for nova in rust so that we don't have to maintain a Rust <-> C laye=
r
within nova. It's going to be a while before writing this driver starts
though, since there's not much we can do without having nova a bit further
ahead in the driver bringup-process. So=E2=80=A6

For the time being, to figure out a set of rust bindings for KMS drivers in
the kernel I've been working on a small project called rvkms!

https://gitlab.freedesktop.org/lyudess/linux/-/commits/rvkms

The basic idea is to figure out as much of the KMS bindings as we can befor=
e
we're at a point where it's possible to start writing up a modesetting driv=
er
for nova. RVKMS as you may have guessed, is intended to be a port of VKMS t=
o
rust. We choose VKMS since it's got a very small codebase, and only really
implements the minimum requirements for an atomic KMS driver. Currently I'm
not planning on upstreaming rvkms itself, however if there's actually enoug=
h
interest in such a driver being upstreamed I certainly wouldn't be against =
it
:).

At the moment I don't have much more then a basic skeleton driver that's ba=
sed
off the nova development branch (currently the 6.6 branch, but I'm currentl=
y
rebasing it to the latest 6.7 branch), but I hope to have more in the near
future as I'm currently working on writing up KMS bindings.

If anyone has any questions or comments feel free to reply :)!
--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

