Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE012B2A6
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB24989A9F;
	Fri, 27 Dec 2019 08:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD4E6E4CB;
 Tue, 22 Oct 2019 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1571737241;
 bh=GJEH9DRR2EKHvmf2sT42XdVTXPY+Q+DE2CfuDqJ5IFo=;
 h=X-UI-Sender-Class:Cc:References:Subject:From:To:Date:In-Reply-To;
 b=QFQcyrHb3Wp4bxgEtd9GUiNn5t5PAf3uDuZ6Geg1a+o04GIU2IRvjDIpYS/uOXUjR
 8R5xP/dlHyzv599YchFXexYj0m7p4tFwheNHFET56i4fD21M20U5L/dYWJa3aHtJ1o
 jDZ1LdCnKG+5GIu67DsWhLJNsWWBQHIdV9yyUqaI=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.150.42]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MUF50-1iV3sp0YzK-00R2yz; Tue, 22
 Oct 2019 11:40:41 +0200
References: <20191021211449.9104-1-navid.emamdoost@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To: Navid Emamdoost <navid.emamdoost@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <b523c3a1-75a7-d94a-6cc6-58e8a1ad73cd@web.de>
Date: Tue, 22 Oct 2019 11:40:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191021211449.9104-1-navid.emamdoost@gmail.com>
Content-Language: en-US
X-Provags-ID: V03:K1:WvY3CEvOjQh0ldBwwtI83W1iznWfi71az+1lM6fbaMdOEPBE0Pr
 mKybrcuo+tK8z4o/zULE9OUmRow5AglMvYVkmOUR3+WQLRQ+Jzwy4ysn0dwzFNX+8VQu96M
 +kbjsojToKBr+FYcc0M+Pm0WVQ3JSrdDnRy6sDThlJLLszBdxQVXR+uZW6EBoI+aDEoQ4xc
 L4MKJbGyZeaLaLIo5GYCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lSdg4XoI/us=:bJvTb1elINsw4nvOhNrNqY
 c4A+rllq+OJEHsQgVSr0atxtM1fHWmey4FdCiMyyuWOw0uZqK2i2ehEzBL1Ezd0V0pQOaSh3L
 hcw3O7zOZ3JOKCv8N2pCRKmgqsPjYq7eqY9ZG6p4gtip/Ujtupbq456Hm/fYoKq2XbWyGCTYH
 NREEAOyIqdfBjMGFs1Y7kCUSH+ULm2cicH5bZRhsnVZHe79JfVKWYiMUG1Di5RG2U1iV/17Fw
 vd8ArfEP6SdJXjU7e1JWMy/OIy73fCQxJ97l92GJ054SsHr3ZQkRdLmfd1bMIpcJDyzIGP1e8
 kGAI5t/iZAJhFqueI90pmGq0jXde/gyoIn9T7YcRp2Dcuj7NgJmBnnzr4GmHfFAlETHqImJu6
 SIYkXXjbawkyHmJgj1XCW4YfomSBjeXjBp4a4+wY5TV+aGIX0xJOr5wQFzr3VUO9PpB3+7uDB
 FIuWJipWLngDga6pBjp7QXRZcXtB5Ik8MFiNPqDDqs3DYijhkON979OLIiH17ggxyulgPBfzC
 lHJQ1GEF55vRzDvau7WiguqFK76xjzp1Fo5wQr1b7lQHzaWXJaXQ3UDiulSpSN3IisVh92ke1
 397JMEGlojZiAnL18/vO0j8SpH08l5hLA6QHH0A17fwOM25IC+tA1v/epofcmPz7P5PCm0UUd
 bd1YsPLZUTUxn/Zx9LtYQFSDmVJUz/D0PO9sVFwiK8xzEDmEcZMEI5Xa3JI2nUgxREdqABtKo
 6DyssGpobL42k09gVWIOPA7+FPLoQRiwcRKRw8YWI2xCfTggcla9lkI2j6xd6MDIK+HINEHlg
 54QcUVWZaqcvcka/0cgZXbDANpL4ys/JiGcnDFmoNhE3eWRXwfZJ/iFfWgQa/3lqj6mzGKWUW
 Pq/2dlCCkbsacugbBpq0pbOKnTJAkNVfAAaUJ31f13hnczr/BR7tuuBpAaGEoqq/+1zZKI3wP
 d/e5GAOWnyBduDnKJybqZU6gac3bgvRfJWIugpkJmkBst1TIKX08hLIUDi9F/koBq+CXpx5Tr
 IcZA19TanFivlIM8Q35DtDjLQvPdfy/0+ncDUKBaOlkJ+yGkLvTlfwFfSqjcXzSKzUyfCgKyM
 8zQBsBBMM8iWUhzLRJK+ax2REGHmOAnM/BBgcvDtWBsbPsI4L5TThLonCwsFNmaACmKvedCqe
 yzRO9Nj1VqxTSL/N1F/IpQ4PkBIXzdmk3ZREIMIOJETBhzq99riso62oAS5z6r8DtKHTDHvXe
 QHtv9sYrjKsr27yX9n8zVqD60iSlTdl/SL7tDrZEgfizql2qhCINAQPelQkQ=
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix memory leak in
 nouveau_bo_alloc
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen McCamant <smccaman@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -276,8 +276,10 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 flags,
>  			break;
>  	}
>
> -	if (WARN_ON(pi < 0))
> +	if (WARN_ON(pi < 0)) {
> +		kfree(nvbo);
>  		return ERR_PTR(-EINVAL);
> +	}
>
>  	/* Disable compression if suitable settings couldn't be found. */
>  	if (nvbo->comp && !vmm->page[pi].comp) {

This addition looks correct.
But I would prefer to move such exception handling code to the end of
this function implementation so that duplicate source code will be reduced.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n450

Regards,
Markus
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
