Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD9DCBAEAF
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF6A10EC22;
	Sat, 13 Dec 2025 12:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="a583IQHj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D2A10E283
 for <nouveau@lists.freedesktop.org>; Thu, 31 Jul 2025 15:46:36 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4btD2w6vvyz9smJ;
 Thu, 31 Jul 2025 17:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1753976793; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nqSqnIBT+SHJ9AizB7Ds7cjospfQYyj5MAaxXf/CUTI=;
 b=a583IQHj17TnZm2kYRSRkRL3d85eAIKkjqNmRxTxRUZfFGLRxhF3gvPv6ZdpCbljw/3ypw
 HkqMV3lZRm0BVyeHLCNgG5LTT1apwLVXu0nHjx+hWEB+QVaAP6uuojfVW39U6We8r087HD
 tlLclS74neeZagvkY/ltfUlkgwPMzQD/v5J9knfx/exibfkv2UyC3WGZ4ym3m8gj+msJ00
 PUdEVqHJ+BXs67jCm0iAxw9WLg6oVQaJxyY394LNSxpa/uxWeMt0Djxq9lS3tlMp98oG8F
 G5UwK5R8fh6Tdj/imwetG3Aatv9DqyUhyp3HhUAedVUbvVlhKLzUMo1b+6GUng==
Message-ID: <481a2808c235f95726d17803503b2b6dc2746dc3.camel@mailbox.org>
Subject: Re: [PATCH] drm/nouveau: Remove forgotten TODO
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 31 Jul 2025 17:46:30 +0200
In-Reply-To: <Z_ZTrZ-dcD5YiSm4@cassiopeiae>
References: <20250409091413.94102-2-phasta@kernel.org>
 <Z_ZTrZ-dcD5YiSm4@cassiopeiae>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: p53bo8i5ur8wo1qck16c34ycr5h7kqgw
X-MBO-RS-ID: b29b12feb864e280c3e
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:51 +0000
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
Reply-To: phasta@kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2025-04-09 at 13:02 +0200, Danilo Krummrich wrote:
> (+ Ben)
>=20
> On Wed, Apr 09, 2025 at 11:14:14AM +0200, Philipp Stanner wrote:
> > commit ebb945a94bba ("drm/nouveau: port all engines to new engine modul=
e
> > format") introduced a TODO to nouveau_chan.h, stating that an
> > unspecified rework would take place in the "near future".
> >=20
> > Almost 13 years have passed since this "near future", so it can be
> > safely assumed that the TODO is not needed anymore. Besides, its conten=
t
> > is useless anyways since it does not specify *what* should have been
> > done.
> >=20
> > Remove the TODO.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > =C2=A0drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
> > =C2=A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/n=
ouveau/nouveau_chan.h
> > index 016f668c0bc1..3b73ec91c4ff 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> > @@ -33,7 +33,6 @@ struct nouveau_channel {
> > =C2=A0		u64 addr;
> > =C2=A0	} push;
> > =C2=A0
> > -	/* TODO: this will be reworked in the near future */
> > =C2=A0	bool accel_done;
>=20
> After having a brief look, it seems that it may has actually been reworke=
d;
> there is only a single use of accel_done, which is in FIRE_RING(), where =
it is
> set to true. But it doesn't seem to be read from anywhere.
>=20
> So, I think we should remove both, the TODO and the accel_done field.
>=20
> @Ben: Maybe you remember the history of this.

Since we didn't get an answer =E2=80=93 how do we want to continue with tha=
t,
Danilo?


P.


>=20
> - Danilo

