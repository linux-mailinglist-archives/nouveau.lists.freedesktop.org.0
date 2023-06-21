Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE85739257
	for <lists+nouveau@lfdr.de>; Thu, 22 Jun 2023 00:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A5E894EA;
	Wed, 21 Jun 2023 22:13:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 100660 seconds by postgrey-1.36 at gabe;
 Wed, 21 Jun 2023 22:13:35 UTC
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98059894EA
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jun 2023 22:13:35 +0000 (UTC)
Date: Wed, 21 Jun 2023 22:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1687385612; x=1687644812;
 bh=4zpkOQcwjRq4278wzAMHBykHtdWpVEleuRpmMGIJDOo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=J1/95fQptzD9XNO+ecjGLh49b6A7XJ0vuK0RKp58KiiCxSBcfps7rVsgCwgCR1NsG
 Jeu4uF5AhB4lDRxxR5UHsxfPB2SCrn8k5H5+Fu5LyTe+Gcw1RPMnvMU8NDlgmpTfI2
 Cbyi2exyxNopBrOkF4wDRCwp6NGPuoUnhbhKTuYBTu/vEAHVsN8axsyaFLzpNBKtQ4
 YZoKj6PYWLwz1h6NCq5SejxRsAKCb5MwR5Rs1eDVr/VyYRgiJHttJZseNtRXE1UUrO
 MoegLUtLz2UgnKEtbGEy455CsaHIkfDKkOHN5WCRnqoWZAUil/5HjGDRgi4Dl4yNmf
 h29jfM9LaS7dw==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <7VkEmw9tAQsZuvc6AX3CTPGZx102IVl7z2vd8jHfIFxXPduS5d79gS1HpD40ik0Gr26myfu9edHs-kRtc_HIaxjIHFynRkiGRvkkGn6sp9g=@emersion.fr>
In-Reply-To: <f70b3789d961861cdefb0752979d4666cdd151ba.camel@redhat.com>
References: <20230620181547.272476-1-contact@emersion.fr>
 <f70b3789d961861cdefb0752979d4666cdd151ba.camel@redhat.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: use
 drm_kms_helper_connector_hotplug_event()
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Lyude!

On Wednesday, June 21st, 2023 at 23:56, Lyude Paul <lyude@redhat.com> wrote=
:

> > -=09if (changed)
> > +=09if (changed =3D=3D 1)
> > +=09=09drm_kms_helper_connector_hotplug_event(first_changed_connector);
> > +=09else if (changed > 0)
> >  =09=09drm_kms_helper_hotplug_event(dev);
>=20
> I'm curious if you think there might be an advantage to doing this per-
> connector even with multiple connectors? Seems like we could do that if w=
e
> stored changed connectors as a bitmask.

I believe firing off multiple per-connector uevents would be worse than a
single per-device uevent because user-space would see intermediate states
instead of an atomic change.

Let's say I have 3 connectors connected, and different settings set in my
compositor when 1, 2 or 3 screens are connected. Let's say an unplug
disconnects 2 monitors at the same time. With a single uevent, the composit=
or
refreshes the whole device state, and then applies the 1-screen settings. W=
ith
2 uevents (one for each connector), the compositor refreshes the first
disconnected connector state, then applies the 2-screen settings, then
refreshes the second disconnected connector state, then applies the 1-scree=
n
settings. Applying the 2-screen settings might cause an unnecessarily glitc=
hy
intermediate state, where windows move around, modesets are performed, user
configured commands are run, just to un-do everything right after.

I hope this makes sense,

Simon
