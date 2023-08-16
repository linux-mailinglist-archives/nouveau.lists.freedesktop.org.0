Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622877ECED
	for <lists+nouveau@lfdr.de>; Thu, 17 Aug 2023 00:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160F10E3D9;
	Wed, 16 Aug 2023 22:14:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1892010E3D9;
 Wed, 16 Aug 2023 22:14:10 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 29FE840E0196; 
 Wed, 16 Aug 2023 22:14:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uAkQTv2wM7Q1; Wed, 16 Aug 2023 22:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692224045; bh=EDI4sHIEq7V/ok4vu3g7Qxtb5Wy13BDjKdqukYKZlXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UAzs3c5SctsxoQVF3W9YGPMFj3S1M/W0FAPUkbHvEWBvnfr9jH4Y+1sHwr4Jx5iJX
 Qp83T3sTPaz1AuO2vZQ2jWIQK1CjM6WhKJz/VsZ7ggxm74thWpOw7P8Qlu6SW9ZeVD
 z6YYlx7A7ytvHJgUJ2krgvcKPJJmD3sxwI89Y3CIIZ9tRi/qTe+q051SPH8RTWx9DU
 1LGdcPkIonq03fX/vLtsm/sxNG/FbE67wIdOJcGgFbu9yw+0Dc7BOvqx7Ml+YvBEyl
 CtZBE6a53gnm7/UNOaWBROOLar+IUmeAf9Wz2DAaJZFCGn/w8/G9iOBGueF89LdBTe
 ADDwdqSQHEkiLGJSzlTnboiRjOyQ+fIQquXqxvMrDuJIgjy8zhfvkROlOQCLIX3iZ0
 c7dFnpj1XISe2mU9Dnj1R9ECBgTdJ+9Eq4bz/JK/M5/7x+Do993C4YUhv6GJUQM5Pc
 Aq4/o9+VWv77+oVs7E4UwhPjKN8auQ3Cw/DoSe3M9RX86z8TvjRsG/6d4PSlkI1IM4
 wRI5Uq5SJHP4ea2wyZ8ADTtxcivm/xa5n0erB4fQ+/JWn0Lwg4bnYSV9PILIZM0Kxg
 1O8cYH6NoiYKT4/JKFky6ISHK5NvedehVydEaBNa3O8ILDNNRI7YGZQ6KVAVtBpAYh
 9WfUkvVpfzate7a1VVRRcnco=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6B72040E00F4;
 Wed, 16 Aug 2023 22:13:58 +0000 (UTC)
Date: Thu, 17 Aug 2023 00:13:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20230816221353.GXZN1KIXloRn8cGt5E@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
 <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
 <20230816151252.GKZNzndDNySuWC+Vwz@fat_crate.local>
 <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tunC5mEu3Tw64rKLqNM6MN6d=N90kYQKYwXWNMB=ahDaw@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 11:27:05PM +0200, Karol Herbst wrote:
> that GPU has only a `DMS-59` connector, is that right?

No clue. How do I figure that out?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
