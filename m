Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635DD20163
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 17:10:17 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8C10E585;
	Wed, 14 Jan 2026 16:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Pxk417ko";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 688FD44CB1;
	Wed, 14 Jan 2026 16:01:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768406504;
 b=bg6KWslEyOBrlzLN3StEGr6qaeDkvz17BiAeRhpF/m7ZSybmj/XdYk1IXt5O9H+kbyQi0
 5QDYLqIl7GosLA/p55/rGlQwqah7Fj6JPD5pUc54oyee6vbb7NAzJLqa+md9PUQ++cacC3P
 8Cdwfq7lhJY+3Rz/lr6/yDSGHd+zJo2cGy4Lh0PT+Gu9YDu5f9o850jTfFW59yX72ZX0YxK
 h8AZfNldP8SyGQld6nQA1CD8T7O2epgNhji2AextQNZNhLv+pvBDAfLMu4sSC+mXp9KQupr
 pGOenXu7Al2DhTYBVWVnWGcmOVm4h5lkafgkmqOS/yFtQGEIhxCM2HYRf4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768406504; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PZs5fqIMLt7xFgkH9feH+iQ94BXbr5mjq5T/kVMjMXo=;
 b=CUzMN0ZACQnmNWoC6A7CX3F/WoseQPqqaCJsbVfogTZp4rN4KJsggLGn+/wTPNVrmJfYl
 CbQWOpdyYF/7wiRG3bkLroqk69tWlB6pH4aGk/YenxavjTB0vwtMc/jxAuZscFSzK1ADLiX
 FEfYaQ8OyttmbJurh5uZFyrsG0efa4vYw8KohVTB+ct0+zHRT4KaT49zDfojl++i16Bhhls
 i2guX3wFU6FJsiMZyK9GG7S+JsCyEfC+C2NdXgnoHxIvrrBxiXU5K0K5GJXt2hAPw1HBEhO
 8wdnOR/H8re2ndpW82+2rq9G4aTiq2jdZQx6XgHY6rju+uFGnDxASM/lbwJw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 41289400E0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 16:01:42 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2F310E585
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 16:10:13 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-50145d27b4cso13856491cf.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 14 Jan 2026 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768407012; x=1769011812;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PZs5fqIMLt7xFgkH9feH+iQ94BXbr5mjq5T/kVMjMXo=;
        b=Pxk417koEnGxTNBsRNIl1TJR062t43gbQoPsEX5dEE5V3VHycu7njgPS/mksIXBkbh
         xwc65c3s6W1UPty7ojtWXg+/1xXT95mDWn6RMPJPCvxlG1ag6fGu5OOwYgODm193xOhn
         VoPF3AhyZJcN1wvAQenYtWiw2T2GuaAs8yKdWqCD5pEkSFHsrSKJfqFFc0S5m6HZ0/WY
         47yEhBkglz5rA/NVUBjgvbMt5UJWXYto7pIwtNnfJT7MZwxbsLJokkyWDbGvxxbp6f6J
         RuSmZeP0PZ3rmRlYUw7KLBokq/WDjZPLTVjLeQLbpuwHwXowWkZBxFp5bUfGB2PxxoV/
         odPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768407012; x=1769011812;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZs5fqIMLt7xFgkH9feH+iQ94BXbr5mjq5T/kVMjMXo=;
        b=ZaD+8OpmbpSgTcNjkx2CPx8TSkkLvO1NiZQaDjpHlgOi/Bc4IztkCqdsYykYN90Gj7
         OF7YKNFhWygLyz0dD3Gp9xk57OpF1N6JGvAr2aTYBHQMP0dEUZNxJJ3bWCEb7DFJcifj
         6X87nh5NY9+3tPMKpqbYmyuu6+7uZLoVZaP5ttmS+NKJyqANBn9NL9mywUNYDwIiigtx
         vBpWQRaz+g6DQpTk2DCtnJv6THcg5twYyu2oktok4H2CJAc8dQaZAuVF8y3Yz21N5djS
         FxskQF08GhLaLUClt2w4SonUih3s+eLVl2ugSZ7oZfjsuRMU67v/uFW3lkLQRbpk+Myc
         8QbA==
X-Gm-Message-State: AOJu0YzcqBJ4cLxtq0YKdrt5/NEG7pDjGMrh3Ut65+oXaYjxcICW1KHy
	LcH1aJOWysVyvxLfteDMjgwTAMub6uQhssskDkoBAgPa3Tjt3lOS+UBMIv8VCLWIMJJijX32LZv
	J8ej2sCN3LGFbniPsXtXwjHd62oyG0vQ=
X-Gm-Gg: AY/fxX5XorvQIQgdHcY97UH2UB4rYWYgJ+Bx6pysxy4Fsq8s4uli6pi41/eYUC/KrLt
	rw/s0d3s8IA/vLKY/i7c4rg8L+v969dGBnERJDKbPh+kAb+m74dINkT1r4dplmH34J2i7SmfEq+
	dhkTEJzX49t649UkcY4dSBm01Bq/nzglKSn+h7EeR4YNqxGq8mL8WZ6Y84jR4dvLfXORFNqm9Ff
	PCd/U7eIzBvFH4Xzk27jVgBOOsH1Qo05Xol6o3enrKKQoHjSqMZRTeQ1jh2+X0JAE4z/MPfc1r3
	lLwNIx25oFxbFMv5zIFMdunt5mS3UolvvsmSYkU=
X-Received: by 2002:a05:622a:a05:b0:4ee:4a8b:d9f6 with SMTP id
 d75a77b69052e-50148481d2amr45236031cf.59.1768407012046; Wed, 14 Jan 2026
 08:10:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:a02b:b0:4ed:a749:541 with HTTP; Wed, 14 Jan 2026
 08:10:11 -0800 (PST)
In-Reply-To: <20251213005327.9495-1-lxrmrz732@gmail.com>
References: <20251213005327.9495-1-lxrmrz732@gmail.com>
From: raindrops <lxrmrz732@gmail.com>
Date: Wed, 14 Jan 2026 11:10:11 -0500
X-Gm-Features: AZwV_Qjm0f5qb382Lk7v2Pio1Blu6dSGOdxp4uZJ_3Fb8hoqiOhwIvMXnUY48bw
Message-ID: 
 <CALmfYjPMTF_gurzX74LiPOmPBhszMCfog8_H+hjHQtg5qdARtA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2][RESEND 2] drm/nouveau: add and implement missing
 DCB connector values
To: "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c57d6406485b578f"
Message-ID-Hash: T7X7IJYV2HVNG6ECQU2HDHMVWTQ46XH2
X-Message-ID-Hash: T7X7IJYV2HVNG6ECQU2HDHMVWTQ46XH2
X-MailFrom: lxrmrz732@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lxrmrz732@rocketmail.com" <lxrmrz732@rocketmail.com>,
 Alex Ramirez <lxrmrz732@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/T7X7IJYV2HVNG6ECQU2HDHMVWTQ46XH2/>
Archived-At: 
 <https://lore.freedesktop.org/CALmfYjPMTF_gurzX74LiPOmPBhszMCfog8_H+hjHQtg5qdARtA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

--000000000000c57d6406485b578f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bumping for visibility. Any other CCs I should add? I've been trying to
submit these patches for a few weeks now.

On Friday, 12 December 2025, <lxrmrz732@gmail.com> wrote:

> From: Alex Ramirez <lxrmrz732@gmail.com>
>
> uconn.c's handling of display connectors was refactored for Linux v6.5,
> causing a regression that issues a warning on boot for GeForce 8600m GT
> (MacBookPro4,1)
> and likely other legacy GPUs.
>
> Several connector types used to be implicitly supported before v6.5 by a
> branch in
> [drm/nouveau/nouveau_connector.c:1353] that determined connector types
> using encoder
> bits, but these connectors have since been left entirely unhandled after
> the refactor:
> the aforementioned kernel warning causes that branch to never be taken.
>
> nv_connector->type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of an
> unknown
> connector because the WARN_ON macro in [drm/nouveau/nvkm/engine/disp/
> uconn.c:214]
> causes nvkm_uconn_new to bail out before a suitable connector value is
> chosen;
> it *seems* like the value is left undefined.
>
> This patch set implements the missing DCB connector values per NVIDIA spe=
c
> to fix the
> root cause of the warning AND changes the WARN_ON macro in uconn.c to a
> printk message
> to more gracefully indicate unknown connector types, as was done pre-v6.5=
.
>
> v2: Include better commit messages. My original submission was partially
> blocked by a spam filter.
>
> v3: Update NVIDIA documentation link according to Petr Vorel's suggestion=
.
>
> Alex Ram=C3=ADrez (2):
>   drm/nouveau: add missing DCB connector types
>   drm/nouveau: implement missing DCB connector types; gracefully handle
>     unknown connectors
>
>  .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
>  .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
>  2 files changed, 116 insertions(+), 41 deletions(-)
>
> --
> 2.52.0
>
>

--000000000000c57d6406485b578f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bumping for visibility. Any other CCs I should add? I&#39;ve been trying to=
 submit these patches for a few weeks now.<br><br>On Friday, 12 December 20=
25,  &lt;<a href=3D"mailto:lxrmrz732@gmail.com">lxrmrz732@gmail.com</a>&gt;=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">From: Alex Ramirez &lt;<a href=3D=
"mailto:lxrmrz732@gmail.com">lxrmrz732@gmail.com</a>&gt;<br>
<br>
uconn.c&#39;s handling of display connectors was refactored for Linux v6.5,=
<br>
causing a regression that issues a warning on boot for GeForce 8600m GT (Ma=
cBookPro4,1)<br>
and likely other legacy GPUs.<br>
<br>
Several connector types used to be implicitly supported before v6.5 by a br=
anch in<br>
[drm/nouveau/nouveau_<wbr>connector.c:1353] that determined connector types=
 using encoder<br>
bits, but these connectors have since been left entirely unhandled after th=
e refactor:<br>
the aforementioned kernel warning causes that branch to never be taken.<br>
<br>
nv_connector-&gt;type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of a=
n unknown<br>
connector because the WARN_ON macro in [drm/nouveau/nvkm/engine/disp/<wbr>u=
conn.c:214]<br>
causes nvkm_uconn_new to bail out before a suitable connector value is chos=
en;<br>
it *seems* like the value is left undefined.<br>
<br>
This patch set implements the missing DCB connector values per NVIDIA spec =
to fix the<br>
root cause of the warning AND changes the WARN_ON macro in uconn.c to a pri=
ntk message<br>
to more gracefully indicate unknown connector types, as was done pre-v6.5.<=
br>
<br>
v2: Include better commit messages. My original submission was partially<br=
>
blocked by a spam filter.<br>
<br>
v3: Update NVIDIA documentation link according to Petr Vorel&#39;s suggesti=
on.<br>
<br>
Alex Ram=C3=ADrez (2):<br>
=C2=A0 drm/nouveau: add missing DCB connector types<br>
=C2=A0 drm/nouveau: implement missing DCB connector types; gracefully handl=
e<br>
=C2=A0 =C2=A0 unknown connectors<br>
<br>
=C2=A0.../nouveau/include/nvkm/<wbr>subdev/bios/conn.h=C2=A0 =C2=A0| 84 +++=
+++++++++++-----<br>
=C2=A0.../gpu/drm/nouveau/nvkm/<wbr>engine/disp/uconn.c=C2=A0 | 73 ++++++++=
+++-----<br>
=C2=A02 files changed, 116 insertions(+), 41 deletions(-)<br>
<br>
-- <br>
2.52.0<br>
<br>
</blockquote>

--000000000000c57d6406485b578f--
