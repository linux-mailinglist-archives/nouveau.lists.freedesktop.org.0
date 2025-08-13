Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF079B2497E
	for <lists+nouveau@lfdr.de>; Wed, 13 Aug 2025 14:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC3710E4F5;
	Wed, 13 Aug 2025 12:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="IfWYN5/J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Wed, 13 Aug 2025 12:29:12 UTC
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E2AE10E4F5
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 12:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1755088150; x=1755692950; i=markus.elfring@web.de;
 bh=fFCdGCqwYIBKBI9DweXmHAL7W7na2k0tYFkPZX6daGU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IfWYN5/JLHPSC1MfBD/120tNrcCbAygtDgMrPfWSEViHOZqd7fPcBlXAfyqxeKSy
 4MtGybYK8Cjwl1d2566+VAGC6Jl7bBBvmxFlg531MwAn38Admnd25G0cjO8dL+TGT
 ifjjVXxY/aMbBEDdj1qKGFMbpn/pVN0kDJu4lbTRq48YeiGWmqap611PewAPCfRLI
 ZPXAkHlTH/P2PHCN9F4Xl3EDT+o3XApcR3tQ+tcnKzguLZI70mBtROHI6IszKntwe
 27qU8sJmy1xpZinJFlMNMvUo+H9DqzJYNYVTFnhDx+ooT/R/3AyFXn2RSwPJN6E4D
 y9ktpLDdp6Gd49SaTQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.246]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MdfCH-1uD6fw3grR-00g95N; Wed, 13
 Aug 2025 14:23:21 +0200
Message-ID: <75e25786-600b-49e3-bc03-6b62d1d23ef4@web.de>
Date: Wed, 13 Aug 2025 14:23:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qianfeng Rong <rongqianfeng@vivo.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250811091910.404659-1-rongqianfeng@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vED6NZO1Em0A0dUJgJZsiujF3/bIxGPgJ4pmYr47rwYfB10yGSW
 01//eUgphrnK4sQC56fbargPkcAeWAP3YlaqHc9UAgOfwiowGPvxdszaBkhrbqsmdEXgUao
 6L8gazl4ldw7GroIyOM4so2CMCa4D/t9Vw9TKV6WLVRKqeAMOJHmcl8LPw4g1mCsqOwXm0c
 Q91H64qRm3NdUNnVr2/ow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HLKqiVZamiY=;IhZKzv4VqN1jz55PEG2UYdvGw27
 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
 zw==
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

* Would you like to improve the exception handling by using another goto chain?

* How do you think about to increase the application of scope-based resource management?
  https://elixir.bootlin.com/linux/v6.16/source/include/linux/slab.h#L1081


Regards,
Markus
