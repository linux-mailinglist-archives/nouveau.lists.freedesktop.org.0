Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0191C52F
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2024 19:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E0310ECE6;
	Fri, 28 Jun 2024 17:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VyFxAtF0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819E610ECF0
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719596955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TAd485aghXUIWa3RvWf2lTA7jc9MG6PA9b0qtG0r2DY=;
 b=VyFxAtF0vTrLzbo9uVL/TwYJBVlP+7hG4eYgfwHAdJuJA4W5Ommf17FJrmNa4DAZvIyjSy
 HaD9DgHlo9jplgXFwjk+5VERJ+zcFeO183DU4qOytcu9KH5OhneXTrtXwqmMyaH+gHpjfN
 BV4NzpN0jjlJfCTOWJCaw9PYZzvVKng=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-8B6y6RnbMrWtv46NCGCtOQ-1; Fri, 28 Jun 2024 13:49:12 -0400
X-MC-Unique: 8B6y6RnbMrWtv46NCGCtOQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6b50c903a87so12402556d6.0
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 10:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719596952; x=1720201752;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TAd485aghXUIWa3RvWf2lTA7jc9MG6PA9b0qtG0r2DY=;
 b=xKgu/SuNVy6PySTEHKYt3fJg5oV0T5WgIVeFKfaYIYhI7XhYl/0bcUg/PshIeUtImq
 QWrzBpatQFO+YP4eyMvbElEQpqbBdjZEFXK8MudXc1Gx/dQLJwC8iEgK1IR+IJsT1BoI
 jJVvWD1Dqr4G7qgOUkU4wNGDyyOvXk0ACEdEFclBABJus4AAzjpt8fq/JRYMrELxxObb
 5FGfOvl27L6bZJ+9sBEkWr3f8eOIBQUTzN6QqZz+bNKkdULES3p+sc12JtDGxwjQHW8f
 nYYlna+8XVGb+oXvqOHpZjwWx2HLGDZhUQgte6UK8NKk2/HEr6FTgBAISQY+c5Ix1qvp
 SUwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUM3t01BmV+xfzGwiXXUSfSQOXiBOi8/TGLeAaS/IoTH3yB9EHqakNSY5E4sb5sCCA/q9H/B1NPMj60uNtinXTHnToiUTb8ia4/c1L2A==
X-Gm-Message-State: AOJu0YwCStOAC02KW01BCIVDabgyWmCNxUlrbml8mqYkneBrJ10l8Qss
 iIj28w8pDU8+E8gtxi0jhDubI7hgtzw4fmWtq8blVHKu2CQq/gtgMOuX0NLflZ4zcoZY8HMez7u
 xE9cK+fQFcPva2ECSMQNfY4Bx/V0CezLBhtxNi8aYzRqLQMUw4qWfkffGe0J0l6g=
X-Received: by 2002:ad4:4082:0:b0:6b0:76f1:8639 with SMTP id
 6a1803df08f44-6b540aaa739mr160298636d6.42.1719596952196; 
 Fri, 28 Jun 2024 10:49:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD6uWQmG4g/igtbloLZSfV+o6cXp2Ckk4uZLpiMQfw5WzwRbofwx6QnvQrMRlxIyNBmHOHyQ==
X-Received: by 2002:ad4:4082:0:b0:6b0:76f1:8639 with SMTP id
 6a1803df08f44-6b540aaa739mr160298396d6.42.1719596951873; 
 Fri, 28 Jun 2024 10:49:11 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e627242sm9625366d6.130.2024.06.28.10.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:49:11 -0700 (PDT)
Message-ID: <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>, Ma Ke <make24@iscas.ac.cn>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Ben Skeggs
 <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich
 <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, Karol Herbst
 <kherbst@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David
 Airlie <airlied@gmail.com>
Date: Fri, 28 Jun 2024 13:49:10 -0400
In-Reply-To: <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
References: <20240627074204.3023776-1-make24@iscas.ac.cn>
 <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40)
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

Ma Ke - I assume you already know but you can just ignore this message
from Markus as it is just spam. Sorry about the trouble!

Markus, you've already been asked by Greg so I will ask a bit more
sternly in case there is actually a person on the other end: you've
already been asked to stop by Greg and are being ignored by multiple
kernel maintainers. If I keep seeing messages like this from you I will
assume you are a bot and I will block your email from both DRI related
mailing lists (nouveau and dri-devel) accordingly. You've done this 3
times now.

(...I doubt I'll get a response from Markus, but I certainly want to
make sure they are a bot and not an actual person before removing them
:)

On Thu, 2024-06-27 at 11:02 +0200, Markus Elfring wrote:
> > In nouveau_connector_get_modes(), the return value of
> > drm_mode_duplicate()
> > is assigned to mode, which will lead to a possible NULL pointer
> > dereference on failure of drm_mode_duplicate(). Add a check to
> > avoid npd.
>=20
> A) Can a wording approach (like the following) be a better change
> description?
>=20
> =C2=A0=C2=A0 A null pointer is stored in the local variable =E2=80=9Cmode=
=E2=80=9D after a call
> =C2=A0=C2=A0 of the function =E2=80=9Cdrm_mode_duplicate=E2=80=9D failed.=
 This pointer was
> passed to
> =C2=A0=C2=A0 a subsequent call of the function =E2=80=9Cdrm_mode_probed_a=
dd=E2=80=9D where an
> undesirable
> =C2=A0=C2=A0 dereference will be performed then.
> =C2=A0=C2=A0 Thus add a corresponding return value check.
>=20
>=20
> B) How do you think about to append parentheses to the function name
> =C2=A0=C2=A0 in the summary phrase?
>=20
>=20
> C) How do you think about to put similar results from static source
> code
> =C2=A0=C2=A0 analyses into corresponding patch series?
>=20
>=20
> Regards,
> Markus
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

