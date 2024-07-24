Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243FE93AF20
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2024 11:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E06F10E5DF;
	Wed, 24 Jul 2024 09:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="FfV/C+T3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Wed, 24 Jul 2024 09:36:33 UTC
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1310E683
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jul 2024 09:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1721813786; x=1722418586; i=markus.elfring@web.de;
 bh=GI16kZp/DZvJnXEv3qKUE7rVQHnu64qzaMVHUItjoNw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FfV/C+T3vVsT4HRaw3/XnTjSIT5S+FEDikXvmEjS0XWYzMz+m9VpFrXUYZLqeaQk
 RxWx/7/Jgtjp/1yBsXWFuaiYuhPSE5Ej/YsJXR3olh2Cio7KLEDYXKBlsjpXXpHhN
 9nCRbWf4CxUzOIVBMLzrKAZ5yOHfNkjJpy6ZkOlt8KV5EVHSUMSpyr3uaiBEAJ9hU
 l3bmKj0swj5HRtYsE9I+8OHp5yES0dIqQiDeMmGLCthq4P/kT1GnPJFG/t5dGQXUg
 lgSA8+OHZC3Nm/5MB/PQJSQJqQ+L/AN67BU6vU7yQ3kn7VNuUyWEiaScpjE1icKqj
 43I7Y5K/B0MgCItyKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.89.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N4621-1s6FvG0jk9-00wNRB; Wed, 24
 Jul 2024 11:30:51 +0200
Message-ID: <6ccf3891-fd72-47de-ab89-cdc7e9425c56@web.de>
Date: Wed, 24 Jul 2024 11:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/debugfs: Simplify character output in
 nouveau_debugfs_vbios_image()
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Ilia Mirkin <imirkin@alum.mit.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, LKML <linux-kernel@vger.kernel.org>
References: <cb21950b-286b-4630-9052-cff9e7e56337@web.de>
 <CAKb7Uvj513trzg9bVGrjcQ8CfO4anCq7e9mgbD0eZKh=zNLy=Q@mail.gmail.com>
 <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <147bde68-2b66-4e0c-890d-30571a99eee1@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RrGA6l7txMMXcnwEjtBSuPugQcQ+Aylad8jkNWgceoTGStNyfqr
 wTlrqWtDAlH0lOi3LmxFuBdFOurzcAMSBbVSOyx+7nYCzF9yEcAoO29vnrsaXFglXk2xPCj
 xn93kdCjgeIzu8z0n84elnUVbB32IjyF3DtuT04QF72Qb6Ozr7fwwcCvhY/mPFW43KB60nl
 6D7f2g3ZueR3VhfSCZLEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DOVfyq2kSzU=;7GH4JuHGGwbRVBGgzlTj+gV3x32
 IvVYGQE6sD3nNE0sXZMJ3MMZh/cqXG4EmPRczgvN03GQbM2qVQyDGPm70KYVjNaKSSQRbLOd+
 7ZZOGIOOtLHqOYh6HGwg2nMosjRN1f75UpCHN1VdO0Yht9mHPNfI1umVnnPV6gCdjS5EIxbFn
 Tnq2Se2b/+HbT7E1+d4KnRxRVBRa13wibbKPLFHUt3Tu6oqHpIcA3cou0HHowW/KzKu4NIuzw
 wYTmAQvL4KhSTb+SHEWnJw8Bj62iquRsrTyTNB3WGfeyP4A0S1kGjMKuuXfPNYS9rgfseqYEV
 5/ycEIKVizUOS2TrKI5cl6KBhbyuAqS4Y8t9lVzpwJAyAwjwmfJ77RdwgMLywolsE1iN/PXQm
 Uqayk3FGuefzIZ59VXmqzNwRd/mSeeaLqZQUeEUyFqhOcPDCjOdTvSBRzMwdCoI2ub1aIn3V/
 EEq380rlKCr3nR9h7OEwm1Oyd3MyBF+hEg1TaCeqsHYSpt/o0BoAus5ace90iIO1JrAd2cqc4
 pgpx8lHGiFcy4cCri1ZdMprNNjj+FvpdmL3Y4jJww+npcoGNTM6tci5hvn7rjiS08Oca5/tQh
 s077vzyTcxXpP/lDdHlVA/mlhDQJiJPq1mEylkIEPEyizckoPB0ap6r7F3d22pNNibflSDsEU
 7yIRh5tYgsnIkDmhtNbKmkCGK0vWJ82otxogBDgVecyxAIMeahlfMxpeLelQv/LDXwuTyVVkm
 aK5MkmEH6Eyp3tp7OLHjndtdcavq6o+j4X5YRxrPNsEMhSinR1LncuMYeNKXUskdgpTtdEk3e
 qV46WhJAyTzk3OKCf0ZP0LbQ==
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

>> Is there some reason this whole thing isn't just
>>
>> seq_write(m, drm->vbios.data, drm->vbios.length)
=E2=80=A6
> I don't know if my answer is relevant or not here but:
> =C2=A0=C2=A0=C2=A0=C2=A0for () seq_putc();=C2=A0=C2=A0=C2=A0 =3D=3D> wil=
l fill 'm' with everything that fits in

I find such a discussion approach strange.


> and
> =C2=A0=C2=A0=C2=A0=C2=A0seq_write()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D=3D> is all or nothing. So if 'm' is too small, then nothing wil=
l be appended.

The clarification can become more interesting for this system detail.
https://elixir.bootlin.com/linux/v6.10/source/fs/seq_file.c#L816

Was the sequence size (or the file capacity) appropriately configured?

Regards,
Markus
