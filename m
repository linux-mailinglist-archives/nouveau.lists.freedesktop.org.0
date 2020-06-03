Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440AF1EC89A
	for <lists+nouveau@lfdr.de>; Wed,  3 Jun 2020 07:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C961B6E4B6;
	Wed,  3 Jun 2020 05:10:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jun 2020 05:10:38 UTC
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD0A6E4B6
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jun 2020 05:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591161035;
 bh=EBSTXtu1ei7txhmEeQVcUPxSCEHlwUnoocCsxoIbpao=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=l1/uhoRR42whWVbLRIgXnYqMIXOaZLXEroWdf2p0RYIbSz5YoayfdXWrqsphqsshs
 vH4n0pEGr7uo6kQWEZLGCsprxIIJlhSzgs8atggHWs2//3Um+IZvIRPbE8s4fIsA7m
 KsLoppBdwF+3glljdz1XsvLLtPnBYviOI4bWyDx0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.82.231]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MumNL-1iove91CyJ-00rm2g; Wed, 03
 Jun 2020 07:04:46 +0200
To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
 Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam> <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
 <20200602153900.GW22511@kadam>
 <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <75a33776-cd69-edba-8d20-ffcf99ca1879@web.de>
Date: Wed, 3 Jun 2020 07:04:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <5d580094.f274c.17277fc124e.Coremail.dinghao.liu@zju.edu.cn>
Content-Language: en-GB
X-Provags-ID: V03:K1:HBphbPr3xWqK/Noy1A3QhHsm7WTySxNbm5b0+Lz/09Uxie+7c74
 08LVOOCIidrsRqtFHthQf8yJLXYQE6of6jPr0+jOjYLfXIisO1I5FNUnF+AwEOcB00d4fyf
 htrEcuVkeXjxl1ISV917SvJ6ASBw6Htsnlbxi8/JtkRRX3PHOiLdTuq7ppZ6U8rFzG2dGzZ
 6iXA5Sv/6Iq9uCLZLOMSQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TGSdMuzKUT0=:T3KBgDNr/qgQ8sEM27u/Zt
 nK3bbWQMJ7H0UPvl54Lspp3GxGwhxfAKNtsv1BO7WJkJc8BjEJM5V9xp/nzBRq6zktpxplOUd
 SUzoyTRi32dlCg3ray0CmVCRxaE6CVojRO+K9+Y7kpkiS2Tdvch5u1zW78vZ2uZKTxno20mCs
 q9NxCwA3GXfeEzn0AyADEFqbYu7Wud/zGffod81xS5JjyQXLWk8qM472aj8c4YW54RoPkp4iZ
 +L4y4sn2Z8rZeenPmdE15bvwMnm/+sdMT752lbtBdDELX8q8X5sZDKIHNW70uUbcXzLRwKfyb
 TNenPdmUPRdTytX/FPIX7NkAWQlV1PJIqav3G8Ep25S7VGhtUlXXR+oMs9kJ1GS6Nf62PBXyu
 StTeCb9xcUkEm8Lo5m+XYEQQptDjb5z0bT9H0HHRJ4UgJKi+fk2zRnjhyIVkS8trYDEXNLkpH
 k/iY6uD2MjEkyO1SkSTEHWlhZzCNUVLT/AGmiuIkMbLPpaOuxGgewwI5+yIXPd/bivzeUIXS1
 Vf1tw4GX0l17X/RZvyLQ1Sbs2fIl8h1WyaFBhQxMKFfhpfTct+0W0eNdp4uWpgCqiwd7OR6Rm
 zEw6XE/xA0fOSthVmmJR5jIMA7U8jboL5SydMygKMnb82V6r1hjuuPI8KHGTcvbS/tK1lxo8h
 zLbyKTG8BjeK114Gb7iN8dyxLbOTPQlvXaveUKGFyTX8eWo8W1x+1QUxZqDH7Ok5deevssnsJ
 4p8GbE5BXZKZm3wou+EJsb/UgkgcxYlUjW3gv3FMWXwFMAqGrP9iFXRzu+1Ha9ZCm1nH7edSS
 Dsl8AKxsmPEwPYaZq4DXY37Rzr/61yFUIuK7t9fWQ8EK9vCrh6xoH7jME2isarDFoVgANCR9c
 MXHGluf6ZCHyScuw3l8yAfK0vh1VMXcE6s1Zoaa9ZNr54+l8qstfnasMJNiL2xzsVIyNEyZCz
 qdm7OaigJuOkI+PdRp4VfMXVvTlhObS4rISF46Duj3pHXGOoVvMzg7V6vU8xULFp3B28nc679
 LJUE3TXaDUFCgf+M/STHk7JcoS2Ng8FPfFWjaZMokv0OvRu7oGkGVsR2/DA6uAALkoeQN+TxC
 4RATzEY0cAc3mN5fmFPVpOTHrA6RDT30/WIBdNkE8DiZDGrSPhJzhl2WFQFL+atk6PZdj6AJn
 Z/W7BOC7FFCyzO4gvJYtuvrQsayoukchEeoTQxiFJCjXB6fkPpwCBL6cSMRPxpAVLvslRGYKt
 nQrA370O6CD7Phsla
Subject: Re: [Nouveau] drm/nouveau/clk/gm20b: Understanding challenges
 around gm20b_clk_new()
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
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

PiBCZW4gaGFzIGV4cGxhaW5lZCB0aGlzIHByb2JsZW06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzEyNDk1OTIvCj4gU2luY2UgdGhlIGNhbGxlciB3aWxsIGNoZWNr
ICJwY2xrIiBvbiBmYWlsdXJlLCB3ZSBkb24ndCBuZWVkIHRvIGZyZWUKPiAiY2xrIiBpbiBnbTIw
Yl9jbGtfbmV3KCkgYW5kIEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBubyBsb25nZXIgbmVlZGVkLgoK
KiBJIGFtIGN1cmlvdXMgaWYgaXQgY2FuIGJlY29tZSBlYXNpZXIgdG8gc2VlIHRoZSByZWxhdGlv
bnNoaXBzIGZvcgogIHRoZXNlIHZhcmlhYmxlcyBhY2NvcmRpbmcgdG8gbWVudGlvbmVkIOKAnGRl
c3RydWN0b3LigJ0gY2FsbHMuCgoqIERpZCB5b3Ugbm90aWNlIG9wcG9ydHVuaXRpZXMgdG8gaW1w
cm92ZSBzb3VyY2UgY29kZSBhbmFseXNpcwogIChvciBzb2Z0d2FyZSBkb2N1bWVudGF0aW9uKSBh
Y2NvcmRpbmdseT8KClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXUK
