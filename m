Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B674B8A9
	for <lists+nouveau@lfdr.de>; Fri,  7 Jul 2023 23:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5662910E00C;
	Fri,  7 Jul 2023 21:27:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A682A10E00C
 for <nouveau@lists.freedesktop.org>; Fri,  7 Jul 2023 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688765246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YedJvQ8aXiP77STDAQlWTy9BESVnkdmYrUgAzEX4QL4=;
 b=IAHGM7lZ4sv/tP52umvhRYY/dKfhZ1ASFStjhF8bj6x0ZaWNQEg8gS1PFpSwuatHECNiYy
 R/6s2X6FDp0mwP7WbDa/v3aVYA4OOsYKrbt+7tKwsyB7teAnLv5BluC+lM7ZSCw1L/HtfN
 AGeW9z0hj1QUQwdxYaaAicjy2JV2oDI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-hsAWwlTlNkOeJVs7FgyM-w-1; Fri, 07 Jul 2023 17:27:25 -0400
X-MC-Unique: hsAWwlTlNkOeJVs7FgyM-w-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4033e4d51ecso23973471cf.0
 for <nouveau@lists.freedesktop.org>; Fri, 07 Jul 2023 14:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688765245; x=1691357245;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aRCz1owDxNnsSmVTiqMJsBnAmTae+PjtZnNSaet++A8=;
 b=HLxrYdZEBUinMj+0aVevagUHrVOCVsijs7luupzsKWB6MTJYqhVsJsySeF5DFE7psx
 +zOGASjeWLvtfA1wnv6gExUKIPm1XxWv6prTd3qqnbbdBUSBUfeWMdFK3k3he3jHeQv5
 8lQCN/zhCW+0cD0UeQN0HcFrU2j3tgiRPLIlMI5yEGpduuhYUjKDLefto8GFxJtFIO6q
 PKbaB8LcnvHBgux7rKK5cjbCsV1v8RabjYIEstLmkhpe7AhLDnnMHrfBvq8zCju3Bdal
 ApTdfR0HF07eARi5D3CoxeaGT65CdyRKMw0CUrVO9nSVt1bLnh5KHqucUNlcgvk5qwBz
 r0LA==
X-Gm-Message-State: ABy/qLaSDflyra+q0P+dNzE6znOiRbTApzC/rgH5gUwbfJIUBUS8f3ij
 D7SmRPXz1OCVcD3SNQo/tax7lTrUEkl42wohHRDD51vnr3X1xqHzfXsRxhTeDTTbdty+uegstQS
 NJ62PhFmBsHV4f0LSIwYZs+ga+rr8xRR9xw==
X-Received: by 2002:a05:622a:386:b0:400:9390:d129 with SMTP id
 j6-20020a05622a038600b004009390d129mr7062818qtx.36.1688765244865; 
 Fri, 07 Jul 2023 14:27:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFuIjPlE810le5KzXeZ9bNzoMrtVJ8ecgHwmQyVcVv+zYgaKQUdEGGjOQtrM4tcdJSmtXxNog==
X-Received: by 2002:a05:622a:386:b0:400:9390:d129 with SMTP id
 j6-20020a05622a038600b004009390d129mr7062805qtx.36.1688765244640; 
 Fri, 07 Jul 2023 14:27:24 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a?
 ([2600:4040:5c62:8200:4d3e:bd5a:7e0a:133a])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac8660f000000b003f6be76a5c1sm2133963qtp.6.2023.07.07.14.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 14:27:23 -0700 (PDT)
Message-ID: <c94c3351895f3c74615ebb5a8b5cab2b8e5cae9d.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>
Date: Fri, 07 Jul 2023 17:27:23 -0400
In-Reply-To: <7VkEmw9tAQsZuvc6AX3CTPGZx102IVl7z2vd8jHfIFxXPduS5d79gS1HpD40ik0Gr26myfu9edHs-kRtc_HIaxjIHFynRkiGRvkkGn6sp9g=@emersion.fr>
References: <20230620181547.272476-1-contact@emersion.fr>
 <f70b3789d961861cdefb0752979d4666cdd151ba.camel@redhat.com>
 <7VkEmw9tAQsZuvc6AX3CTPGZx102IVl7z2vd8jHfIFxXPduS5d79gS1HpD40ik0Gr26myfu9edHs-kRtc_HIaxjIHFynRkiGRvkkGn6sp9g=@emersion.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 2023-06-21 at 22:13 +0000, Simon Ser wrote:
> Hi Lyude!
>=20
> On Wednesday, June 21st, 2023 at 23:56, Lyude Paul <lyude@redhat.com> wro=
te:
>=20
> > > -=09if (changed)
> > > +=09if (changed =3D=3D 1)
> > > +=09=09drm_kms_helper_connector_hotplug_event(first_changed_connector=
);
> > > +=09else if (changed > 0)
> > >  =09=09drm_kms_helper_hotplug_event(dev);
> >=20
> > I'm curious if you think there might be an advantage to doing this per-
> > connector even with multiple connectors? Seems like we could do that if=
 we
> > stored changed connectors as a bitmask.
>=20
> I believe firing off multiple per-connector uevents would be worse than a
> single per-device uevent because user-space would see intermediate states
> instead of an atomic change.
>=20
> Let's say I have 3 connectors connected, and different settings set in my
> compositor when 1, 2 or 3 screens are connected. Let's say an unplug
> disconnects 2 monitors at the same time. With a single uevent, the compos=
itor
> refreshes the whole device state, and then applies the 1-screen settings.=
 With
> 2 uevents (one for each connector), the compositor refreshes the first
> disconnected connector state, then applies the 2-screen settings, then
> refreshes the second disconnected connector state, then applies the 1-scr=
een
> settings. Applying the 2-screen settings might cause an unnecessarily gli=
tchy
> intermediate state, where windows move around, modesets are performed, us=
er
> configured commands are run, just to un-do everything right after.
>=20
> I hope this makes sense,
>=20

Hi! Seems fine to me :)

Reviewed-by: Lyude Paul <lyude@redhat.com>

Let me know if you need me to push it to drm-misc

> Simon
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

