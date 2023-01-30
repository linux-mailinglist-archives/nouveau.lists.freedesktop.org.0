Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F565681E04
	for <lists+nouveau@lfdr.de>; Mon, 30 Jan 2023 23:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399AC10E299;
	Mon, 30 Jan 2023 22:27:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B4610E2E5
 for <nouveau@lists.freedesktop.org>; Mon, 30 Jan 2023 22:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675117626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPEODcPgRK414okg7foYA/aTV5Kft48PiJghLe7ICGI=;
 b=dXxja1yQtp0nIRGhcg9csDHMmYITiOTS3z3yy4V0/1K4XOCnkO3dVFmLBDuMT9gjn/8UL5
 9e61Nz10Q9iPuvfrk75G6LA5K7gtFr2FOHmARO+XghdcI4emJE3XAYAzjErf+gTChWoSsM
 mTzh/kepgQsILj8uB1aBZ5MfE8nWe3k=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-367-UtsbXUeAM6O9HFfhOrnezw-1; Mon, 30 Jan 2023 17:27:05 -0500
X-MC-Unique: UtsbXUeAM6O9HFfhOrnezw-1
Received: by mail-qv1-f71.google.com with SMTP id
 lp6-20020a056214590600b0053a07384c95so3987190qvb.4
 for <nouveau@lists.freedesktop.org>; Mon, 30 Jan 2023 14:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bPEODcPgRK414okg7foYA/aTV5Kft48PiJghLe7ICGI=;
 b=gNX++Klwk760Smi2dQWLTl0Sp7dZe95/MDyU/7qPxjrxlR2uKFYO706i59v7nI3Plc
 bCCs3IUPVG9kRc5RoaGalo+/PkqyQ5BcSXksaak68pu655xvOXkumhR6QrrPIS+TTTg6
 KZS5KUq18EM/+y69OWMWoWEM4Qm51/+sFzDycCaIiLXVyR7nzre+y2TVhByeKC+ww+Kr
 VUuyTcu4A2sgMsfMInN3KbxsFfGiYFtLs1laRVl28DdkmcQ+myvKvzEUr+mJbxncjNeA
 FrsQbg/bsvKZlYunv3dTV/RJWh8aHq8NrdklcSIQVvLZV6YCsyeepoQ8WHFQ6tAZzPRf
 zlYg==
X-Gm-Message-State: AFqh2kp79Yd8WTY9jFhi2P6qeZcLllgnIuWdDoySC+/KaV9TrUuDg2fg
 /vmhn4V0cZBzRpTuLcBenxbM/rSZYoxos/HFNv+jMbpjlBwPZHGVS10zYWNt+bEr9vxHv3O2PZR
 1OrBT2/xaJz5jt0Iq7E49aU4DKA==
X-Received: by 2002:a05:622a:22a6:b0:3b6:2b4b:5688 with SMTP id
 ay38-20020a05622a22a600b003b62b4b5688mr74319826qtb.11.1675117624925; 
 Mon, 30 Jan 2023 14:27:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPG9zQKSAcIyem1FaWDea42WwKGaM92CTOvtO89X0PGeMDEDGGt8JHya6v+5zkph0JN/g/VQ==
X-Received: by 2002:a05:622a:22a6:b0:3b6:2b4b:5688 with SMTP id
 ay38-20020a05622a22a600b003b62b4b5688mr74319807qtb.11.1675117624673; 
 Mon, 30 Jan 2023 14:27:04 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 i65-20020a375444000000b006e07228ed53sm8877587qkb.18.2023.01.30.14.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 14:27:04 -0800 (PST)
Message-ID: <9e4cb1d818e4ce04c3e465a397e5652349e3938a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>, Computer Enthusiastic
 <computer.enthusiastic@gmail.com>
Date: Mon, 30 Jan 2023 17:27:03 -0500
In-Reply-To: <Y9eWhGj/ecjUcYO/@kroah.com>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
 <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
 <cdfc26b5-c045-5f93-b553-942618f0983a@gmail.com>
 <Y9VgjLneuqkl+Y87@kroah.com> <Y9V8UoUHm3rHcDkc@eldamar.lan>
 <51511ea3-431f-a45c-1328-5d1447e5169b@gmail.com>
 <Y9eWhGj/ecjUcYO/@kroah.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Thanks a ton for the help Greg!

On Mon, 2023-01-30 at 11:05 +0100, Greg KH wrote:
> On Sun, Jan 29, 2023 at 10:36:31PM +0100, Computer Enthusiastic wrote:
> > Hello Greg,
> > Hello Salvatore,
> >=20
> > On 28/01/2023 20:49, Salvatore Bonaccorso wrote:
> > > Hi Greg,
> > >=20
> > > I'm not the reporter, so would like to confirm him explicitly, but I
> > > believe I can give some context:
> > >=20
> > > On Sat, Jan 28, 2023 at 06:51:08PM +0100, Greg KH wrote:
> > > > On Sat, Jan 28, 2023 at 03:49:59PM +0100, Computer Enthusiastic wro=
te:
> > > > > Hello,
> > > > >=20
> > > > > The patch "[Nouveau] [PATCH] nouveau: explicitly wait on the fenc=
e in
> > > > > nouveau_bo_move_m2mf" [1] was marked for kernels v5.15+ and it wa=
s merged
> > > > > upstream.
> > > > >=20
> > > > > The same patch [1] works with kernel 5.10.y, but it is not been m=
erged
> > > > > upstream so far.
> > > > >=20
> > > > > According to Karol Herbst suggestion [2], I'm sending this messag=
e to ask
> > > > > for merging it into 5.10 kernel.
> > > >=20
> > > > We need to know the git commit id.  And have you tested it on 5.10.=
y?
> > > > And why are you stuck on 5.10.y for this type of hardware?  Why not=
 move
> > > > to 5.15.y or 6.1.y?
> > >=20
> > > This would be commit 6b04ce966a73 ("nouveau: explicitly wait on the
> > > fence in nouveau_bo_move_m2mf") in mainline, applied in 6.0-rc3 and
> > > backported to 5.19.6 and 5.15.64.
> > >=20
> > > Computer Enthusiastic, tested it on 5.10.y:
> > > https://lore.kernel.org/nouveau/CAHSpYy1mcTns0JS6eivjK82CZ9_ajSwH-H7g=
tDwCkNyfvihaAw@mail.gmail.com/
> > >=20
> > > It was reported in Debian by the user originally as
> > > https://bugs.debian.org/989705#69 after updating to the 5.10.y series=
 in Debian
> > > bullseye.
> > >=20
> > > I guess the user could move to the next stable release Debian bookwor=
m, once
> > > it's released (it's currently in the last milestones to finalize, cf.
> > > https://release.debian.org/ but we are not yet there). In the next re=
lease this
> > > will be automatically be fixed indeed.
> > >=20
> > > Computer Enthusiastic, can you confirm please to Greg in particular t=
he first
> > > questions, in particular to confirm the commit fixes the suspend issu=
e?
> > >=20
> > > Regards,
> > > Salvatore
> >=20
> > Thanks for replaying to my request: I really appreciate.
> >=20
> > I apologize if my request was not formally correct.
> >=20
> > The upstream kernel 5.10.y hangs on suspend or fails to resume if it is
> > suspended to ram or suspended to disk (if nouveau kernel module is used=
 with
> > some nvidia graphic cards).
> >=20
> > I confirm the commit ID 6b04ce966a73 (by Karol Herbst) fixes the
> > aforementioned suspend to ram and suspend to disk issues with kernel 5.=
10.y
> > . It tested it with my own computer.
> >=20
> > The last kernel version I tested is 5.10.165, that I patched and instal=
led
> > in Debian Stable (11.6) that I'm currently running and that I tested ag=
ain
> > today.
> >=20
> > It would be nice if the next point release of Debian Stable could ship =
a
> > kernel that includes patch commit ID 6b04ce966a73 for the benefit of no=
uveau
> > module users.
>=20
> Ok, I've queued it up for 5.10.y now, thanks.
>=20
> greg k-h
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

