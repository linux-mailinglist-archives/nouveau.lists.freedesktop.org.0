Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC7091C613
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2024 20:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCE010ED09;
	Fri, 28 Jun 2024 18:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZgA3vrk1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E17010ED07
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 18:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719600617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9Im7C0b3C4adLpd6iBlek+WA4C2wJk0bna3KFnoeYU=;
 b=ZgA3vrk13SNV8ehvmUbDzTXwTyQ2jbOnW9meYnRlN7oJwoMsgzQK/Z9HRjtgt8kWc1jbBs
 PQhDf8jGbQOHWPgQtTGPynhGFNFAHu6nPrgyxr5S8rBe4JUsbxxa7sVWW1mWQAnUACzjFd
 6wQPwTnHhNmT4Li62DUaaYXgKYXwgjc=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-vpyyHW9FPym5NecO8pn0_w-1; Fri, 28 Jun 2024 14:50:16 -0400
X-MC-Unique: vpyyHW9FPym5NecO8pn0_w-1
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-48f58259433so392464137.0
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2024 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719600616; x=1720205416;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9Im7C0b3C4adLpd6iBlek+WA4C2wJk0bna3KFnoeYU=;
 b=MkM1K2egHIxu0jRMWlPLn28oPejYq9NY1LF0Hpuiv42Oa6lNli85P6uxeLOEchby8L
 g4Ww13Pj7PV4iLVwqXuA4Y9V5H4v5LQI5EFyzuouo8ESQZG4yRoXvyXJseaz3fSvEeRO
 n9cwRknp1GgevX7iayPA+u9zAYfBWw95LYrf30SBxJ5mXgyUZGS7KwLlE7ntdajk6L14
 kRaV2mYpT4tfNaLNTRZZWaBmEzu5NBs84O5te3+hyb8xH/CSU1ikP6N027U+In/a6s/P
 Kxrl59xVMlY6WUZ6ICW9B5Vsml1B3ZynbhNHIk6Hgwjq5LHLKnNp295ErPKSCJqUSIfh
 y8Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7Ja27Ts0Cr5+ElJu5mSONRliBBZ6Ibi6egQzuye5CoyTmD+Eq49ZkQH//rgEjq3eOtE1bopmT9jz+dp5zZZZfHBy6gz1ticNNviBR2g==
X-Gm-Message-State: AOJu0YwgP+SouQ2aUeXtWI5sMlwG5lhUs4DAkfFMLGheQHNlVLuhihPp
 slkAi72g9H9vXpwG4zkKTZ/uxIdmdbzhyiNb+CyCeNsfwqMnYsD8bEJ9fhe671pG1wrOk1XibEy
 S3fa8I83Ua/BVuMsBwYVWZDlRIiscehUYEOxkqxk801eqQnVdTVuNTVOJwCqEAmQ=
X-Received: by 2002:a67:ff12:0:b0:48b:a44b:c935 with SMTP id
 ada2fe7eead31-48f4f136bc9mr16622141137.33.1719600615816; 
 Fri, 28 Jun 2024 11:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElvRmmINNGnNs7Wpa+F7s40QSKueqKBDp+NCHe0hsGIwjIG9K8A2Un/dqoNkhQbEKVTVc0/g==
X-Received: by 2002:a67:ff12:0:b0:48b:a44b:c935 with SMTP id
 ada2fe7eead31-48f4f136bc9mr16622116137.33.1719600615434; 
 Fri, 28 Jun 2024 11:50:15 -0700 (PDT)
Received: from chopper.lyude.net ([2600:4040:5c4c:a000::789])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d69308142sm96504585a.117.2024.06.28.11.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 11:50:15 -0700 (PDT)
Message-ID: <eab9d109981bae8a443649bc4a2c1a08870590c7.camel@redhat.com>
Subject: Re: [v3] drm/nouveau: fix null pointer dereference in
 nouveau_connector_get_modes
From: Lyude Paul <lyude@redhat.com>
To: Markus Elfring <Markus.Elfring@web.de>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Danilo
 Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, Karol Herbst
 <kherbst@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David
 Airlie <airlied@gmail.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Julia Lawall <julia.lawall@inria.fr>
Date: Fri, 28 Jun 2024 14:50:13 -0400
In-Reply-To: <a91bbb5f-8980-420b-b465-97691203347e@web.de>
References: <20240627074204.3023776-1-make24@iscas.ac.cn>
 <d0bef439-5e1d-4ce0-9a24-da74ddc29755@web.de>
 <790dbe8aee621b58ec0ef8d029106cb1c1830a31.camel@redhat.com>
 <a91bbb5f-8980-420b-b465-97691203347e@web.de>
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

On Fri, 2024-06-28 at 20:42 +0200, Markus Elfring wrote:
> > (...I doubt I'll get a response from Markus,
>=20
> Why?

Because the responses you have been given read like a bot, and numerous
actual contributors and kernel maintainers like myself and Greg have
asked you to stop leaving messages like this and you continue sending
them. I promise you, maintainers are more then capable of being able to
tell a contributor when they need to improve the summary they've
provided in a git commit.

>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but I certainly want
> > to
> > make sure they are a bot
>=20
> Can I ever adjust your views into more desirable directions
> (as it occasionally happened with other contributors)?

No, because you're not contributing anything of value to the discussion
- you are just confusing new contributors despite having been told
explicitly to stop.

>=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 and not an actual person before removing
> > them
>=20
> I hope still that affected development discussions can become
> more constructive again.
>=20
> Regards,
> Markus
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

