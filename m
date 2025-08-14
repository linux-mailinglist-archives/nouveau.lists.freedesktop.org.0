Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3A4B265F5
	for <lists+nouveau@lfdr.de>; Thu, 14 Aug 2025 14:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3C10E887;
	Thu, 14 Aug 2025 12:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="IRmPQTnD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 480 seconds by postgrey-1.36 at gabe;
 Thu, 14 Aug 2025 12:55:06 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C2110E887
 for <nouveau@lists.freedesktop.org>; Thu, 14 Aug 2025 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755176105; x=1755780905; i=markus.elfring@web.de;
 bh=zVL13W91ocOwAPeHUMt2LWTdLAX5fEeuHpuxlt97lXE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IRmPQTnDL6LFAo5rNFaUcQxG8/XSfE/mleV1XD7cMWD9Xpvnkk/Ts9Duhk/Citxj
 nrKyF0/aBoHfuyPcJ5zsu3a1QLQz6BQHDyRGbOh/nnBhL/6PmjLvdkcLVJd3lx6do
 cV9jZqRifp5V+UU611dO4Ri3FyRRMRnYr+mz1V//gGJiaCJDxATWR6Pdm/hsNjJX6
 ahe6jT0fpD2/r0qaVA2jDIjm6dmJJhEE2GiMKEGcX4mDBCxRMa+gae97U2Fx0ThrI
 KAR4Xs2RCfCpmswb7nl/it1Z19xyqu+RvEAKGpjw/EWBSK3N+HLutCfWKakT+1+8b
 DssmsMFUhXtD43p0Wg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.224]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N943B-1uYKOY3nol-015OjR; Thu, 14
 Aug 2025 14:41:09 +0200
Message-ID: <a11bd516-7ebb-4865-9e19-394ee4a5be37@web.de>
Date: Thu, 14 Aug 2025 14:41:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Simona Vetter <simona@ffwll.ch>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20250813125412.96178-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH v2] drm/nouveau/gsp: fix mismatched alloc/free for
 kvmalloc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250813125412.96178-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q+Ts1dLlJAnV62t7pc6QjAw+wAOIlhGEdmT/q2NUMTyS9H71FuW
 Zn8ZeIfX+Sadmqp9VbNreciASR725YvKtZeneLOYDwlBhB6XgIXSFFI65Zsd492YSVwtkaJ
 9K+O3nJ/XAs2B2OnN8vWXvKBQ6q6XgH61bCZCDwTcy3UjtCpAZe0fWZGqTzcvODqWErNkzc
 YzEYuL0oACltYDwD+LXZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WNqD4ij0MQs=;jSfbW53OtnCelJ9ZcxP2S404FS1
 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
 FHuRq6dosn1qnkDg=
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

> Replace kfree() with kvfree() for memory allocated by kvmalloc().

* Would you like to improve the exception handling by using another goto c=
hain?

* How do you think about to increase the application of scope-based resour=
ce management?
  https://elixir.bootlin.com/linux/v6.16/source/include/linux/slab.h#L1081


Is there a need to adjust also the following statement combination?
https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/nouveau/nvkm=
/subdev/gsp/rm/r535/rpc.c#L312-L314

=E2=80=A6
		kvfree(info.gsp_rpc_buf);
		info.gsp_rpc_buf =3D NULL;
		return buf;
=E2=80=A6


Regards,
Markus
