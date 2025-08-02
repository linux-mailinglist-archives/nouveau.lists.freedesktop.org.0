Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E3B18A6D
	for <lists+nouveau@lfdr.de>; Sat,  2 Aug 2025 04:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DB510E0BE;
	Sat,  2 Aug 2025 02:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=efault@gmx.de header.b="lwbVGC7v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C9510E0BE
 for <nouveau@lists.freedesktop.org>; Sat,  2 Aug 2025 02:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1754101588; x=1754706388; i=efault@gmx.de;
 bh=qtL4rp81H38MRtN5NXtBrYKMoGDujZNX63ZwudWaFsM=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lwbVGC7vmfKcBnZ+q4RJGurHp3euFxcwUBSUhkdOhZoElgxn+lD+rOwUxFgzx64W
 SgAbif//i6pa32NmC0mD7Za5hkbPfvkjyJUjqiTgp4vJHW1f5CBNamXZ61JDBcuvk
 zLQmkR+xo+Uk55eX4aZEevMfvKu5bqfttEuEbeQsTM1W0gZQPmVYHPDqFPXFjLrdx
 JBbeVxp1E8dK7FKgV8drAKQuQRwZYGo5cpTZMW2+BISub2hpMxKqwntjdkdu6slH7
 +L0POt7HCloCo+99xFa/sId1Z+MBIz49cow+WxUWqYI7NIiQXw/dZsO3nMBZMiaim
 q7IH6LQPjx29Mujamw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from homer.fritz.box ([185.146.50.25]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1uqnOW1bN2-005Pom; Sat, 02
 Aug 2025 04:26:28 +0200
Message-ID: <880b793fa8863cc87d26f4f353501b70446a89a0.camel@gmx.de>
Subject: Re: nouveau: fbdev: Failed to setup emulation (ret=-22) - bisected
 to 41ab92d35ccd
From: Mike Galbraith <efault@gmx.de>
To: James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, nouveau
 <nouveau@lists.freedesktop.org>
Date: Sat, 02 Aug 2025 04:26:26 +0200
In-Reply-To: <a5482ac0-57bb-43ea-bb88-cd354cbc6d9f@nvidia.com>
References: <709adaad09aeebca8b9c152075056ec5aad69a1f.camel@gmx.de>
 <a5482ac0-57bb-43ea-bb88-cd354cbc6d9f@nvidia.com>
Autocrypt: addr=efault@gmx.de;
 keydata=mQGiBE/h0fkRBACJWa+2g5r12ej5DQZEpm0cgmzjpwc9mo6Jz7PFSkDQGeNG8wGwFzFPKQrLk1JRdqNSq37FgtFDDYlYOzVyO/6rKp0Iar2Oel4tbzlUewaYWUWTTAtJoTC0vf4p9Aybyo9wjor+XNvPehtdiPvCWdONKZuGJHKFpemjXXj7lb9ifwCg7PLKdz/VMBFlvbIEDsweR0olMykD/0uSutpvD3tcTItitX230Z849Wue3cA1wsOFD3N6uTg3GmDZDz7IZF+jJ0kKt9xL8AedZGMHPmYNWD3Hwh2gxLjendZlcakFfCizgjLZF3O7k/xIj7Hr7YqBSUj5Whkbrn06CqXSRE0oCsA/rBitUHGAPguJfgETbtDNqx8RYJA2A/9PnmyAoqH33hMYO+k8pafEgXUXwxWbhx2hlWEgwFovcBPLtukH6mMVKXS4iik9obfPEKLwW1mmz0eoHzbNE3tS1AaagHDhOqnSMGDOjogsUACZjCJEe1ET4JHZWFM7iszyolEhuHbnz2ajwLL9Ge8uJrLATreszJd57u+NhAyEW7QeTWlrZSBHYWxicmFpdGggPGVmYXVsdEBnbXguZGU+iGIEExECACIFAk/h0fkCGyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEMYmACnGfbb41A4AnjscsLm5ep+DSi7Bv8BmmoBGTCRnAJ9oXX0KtnBDttPkgUbaiDX56Z1+crkBDQRP4dH5EAQAtYCgoXJvq8VqoleWvqcNScHLrN4LkFxfGkDdqTyQe/79rDWr8su+8TH1ATZ/k+lC6W+vg7ygrdyOK7egA5u+T/GBA1VN+KqcqGqAEZqCLvjorKVQ6mgb5FfXouSGvtsblbRMireEEhJqIQPndq3DvZbKXHVkKrUBcco4MMGDVucABAsEAKXKCwGVEVuYcM/KdT2htDpziRH4JfUn3Ts2EC6F7rXIQ4NaIA6gAvL6HdD3q
 y6yrWaxyqUg8CnZF/J5HR+IvRK+vu85xxwSLQsrVONH0Ita1jg2nhUW7yLZer8xrhxIuYCqrMgreo5BAA3+irHy37rmqiAFZcnDnCNDtJ4sz48tiEkEGBECAAkFAk/h0fkCGwwACgkQxiYAKcZ9tvgIMQCeIcgjSxwbGiGn2q/cv8IvHf1r/DIAnivw+bGITqTU7rhgfwe07dhBoIdz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
X-Provags-ID: V03:K1:VQPKHT+vNBNvCsg8on6vo0DErC5dNyZoRTs9MfdY7i3ZH3P9se/
 JJNuT0Il9Uncgu9Jq/sy+tCGyOn/MwHFaSzeu9Ul+NYBA/YWWGU9r5rfoH0GixaW0XQAd7K
 W4C44sckv5bFFQSL9j4YTvbQs+XmY3djWiN4C7Rw4h2L+w2xVea+0enjcGpH6IulSf7iQVM
 OdIUZbVgreJf/pkovo2fA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:exp3FyrEWMo=;fHBaUJVAM43v3HK9WGu9r/N5aFC
 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
 CmURVlqF22yw1cqCThiIFmFRLMW6ijGw=
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

On Fri, 2025-08-01 at 15:12 -0700, James Jones wrote:
> On 8/1/25 10:55, Mike Galbraith wrote:
> > Greetings,
> >=20
> > Reverting the fingered commit below brought my GTX980 back to life.
>=20
> See the patch Imre posted a few days ago:
>=20
> https://lore.kernel.org/all/20250728101603.243788-3-imre.deak@intel.com

Thanks, confirmed.

	-Mike
