Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8B3CFD246
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 11:22:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9610E58B;
	Wed,  7 Jan 2026 10:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWtLBUoh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 425C844CA5;
	Wed,  7 Jan 2026 10:14:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767780846;
 b=Wwk+LiXAOZf+yXic/5jjrbUm+fviOr6ksDMbQU9V3a5v3/hvr91OyBhxfitlIz1lhfLDx
 /98R7UwlGN8GfXsu0rribAeT9Le9MxHZRhD9Ig6cpp5dZGRJ2Hoc+NXUyqBX6c7yKafdEja
 QqFf6mRNnnMxyaa1NmidnWMzHBA2TH+qdx3VAQz6IHAfczxPJtjrAkOrsee04HkkwgEiSyo
 60wV6nDM6CGD9S4QpYooyt42sTWwUfDvPIdkTb3+E25qemwakvWjxKedJb0s45QFAoi5JWf
 fgEmDGg5QxHeC6uUwSFbZXGFdBMUA8ArAIay4GVgagKEkLK8EuQc2ZcqAzgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767780846; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
 b=iz6XZS9Ag5ctKaqrbdx0YDsj95Mr9a4ebz6YcO5QDleiDYsVUaomqb5hOeIiHI4n9a3O0
 nF6Mg6SymItuZhx406Cnlt3RcgswxLvRzJtazhbWnyOOqDJPRx9Ps7y0n3cBoAeAYjUdXmV
 +Sr44ct7nxHyS7A2ZzUjV63wS8yyOXwguUbkDmux4spfmEkyUw2j2HmDG+z8vWzsMvW1OZW
 UCmx68jTZ5GXa15gvewj8drdG+uNmdJgzxleX7TL58YGoQYYD52tFOl47BxVIaPhr/rWVYo
 tYmQaruwzGdy6ZEabeg5vWO6Bzz0V0wUC1Z4bzkbP2fyAyZDadvzY7cjPNVw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E5CA44C9C
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 10:14:03 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com
 [74.125.82.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40EC310E081
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 10:22:18 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-11f42eaff60so120342c88.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 07 Jan 2026 02:22:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767781337; cv=none;
        d=google.com; s=arc-20240605;
        b=atVKEg9jH51mzk08uUyqeRrnZVvtmyFa3mQYFo4jOZkyzYUD91SMsILy5YFYfiLUxg
         1K80y8CY5UTInv1TzPBbFXtFGm47OFfWzKpzPMEjBdDSTAJ/Cqxp0jCZ2hU0utF7f4oP
         20YdKB8h/yBZ3V2py4Jkl75bom1wxuSaFSy8+BtsSMgSkJsyBiH3XKXH+ekVADWS0Gxb
         F5eRMlDA3Vt6RgzXxZZygJzwtBlWO/fqZW8ZNlnab1bvpg55kme72RtUs6LfMorUt29p
         nJAglHeb5TBAgQTjaOfFBz5k3CYYbPecAbCXP0wuc4LaBX3ICI+OdWsaSSUqWSVxTYpF
         vQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        fh=aMOoXnnHylPGri08PZqThjKs4lBS/HtonaVzh6i/WsM=;
        b=Sj0ValR+tApZO/n7TKYLutPpT4AxKu9gvCgYP5RvIQ5wMA84DGQrSEBm/2aduvENtG
         m4e5+jM9wmIGP8zduEv/u1JNywHU7VImvzt9tXC7dOqFo08BjzIfUylj7m+fPGnlbT9Z
         vj71EjEo9KVsjHKioGLiU8dSp2d/mtSRUasHLDjJ5yJjfbNb7qu7jiBDXcWfMlsbHfYo
         4pWKxK5EKq9PndVX25gKpQIRG6h6nCzzSMORZ4hfhyZr/Gxc1T2K0uKv4E2nwm/czplO
         sFTsk4WBMq1gHPJ7CEqzDLJ30Ig9drKb80V2dJrYcMxB3lXsWZaK15gyyqHUc/3VtLFr
         KqKg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767781337; x=1768386137;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        b=mWtLBUohHC/XQJW3IzlpVtocvVOKDaGY+u3UmWNRwePypQ1N0nKHF8lu/wDVioGySk
         hHHQ6s1rwcoeCR01SAz31EcwbaY49KEVqjBzWxWV/EMsZF8+3/VrxRT7uQni/g1ZPS/Z
         am3eN0hPutClTzc+JgyHpHjStexfkBqzw4x5g7CxM25nq8RM8ATx+CtBzAdowJg5tKof
         s5Dol7I90uk0mo/g/ZcT8EOtUK1L7YbWnKdrG5Ye6dwXSDcGE6fPZEgPcuXxvQGh+1iu
         JpWia7Sk59PAkRfWTZz0mhcCENPDoEjwzqMr6oE12K28tnBIXlBKdS50D581XusQIHpt
         d+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781337; x=1768386137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NAsA24DaFgUjgLMfDun/Bw7ykH7z+xp7ZKXZOf4463M=;
        b=ic/h7BV0UdiwGTReBnFIE/dTqrUjXt9OJWwZoE90xU1V1K9zwd2oV+Cb4oPE9AW28s
         4GzJfr4t+N0Evc1C4rpL7RdoEjHqpWPZJl78wxKpihfr7uiogjOdta5Pa2hdOL0fw8TJ
         XUv59KGnmpGvwVbkr9aWM9sHjG4FIcsvCq87kd+eR4dWl/hxvqelwyrjIV8hiRwmXRJ3
         BLHHr4cvXcy+J3ft5sa79Od9WTYe4bqHp9L3GZA31POJ06dCQeA8OLXSkBxt8li0vjYT
         1wGe6q5aZRlvhUJZxnKaEJcr4IXnxINvCxT9ObJ7TzhnnaPPO8tttLrZhoAa91MF0JJS
         0GcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzlh45K3zgmPjtRhU9J8DyOY6XtmyJG1WnbAH5C2iVVoto54pyQ6ugoXotAVPYVeJbAKayPIUg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaOMqhVPxYpbIomh77T2VQAYHUebxg3oSNAznsW/xADKhmtTgB
	lbBdyePw+gh9AsMK5VRbD3oOiip3e/8RraIbcEsei8Rz5CSRaLJyDEWQIpaYfzQVUDLSHhebMdh
	fHRd+Ybq56Fdtl4y6YrJYY32x1Pm2nKw=
X-Gm-Gg: AY/fxX4boa8iU32ROqEQhZGKZ7zG5t7CfThIiP56mAD7lGIbY6FCfJ91VDTSE9IN2y/
	jb4eLftNnM8EnQhbJHBwlfAG37NFzApPUpb55Ulls8+QGrsvb56MYIJGmZ59VuwEce0W2218SwB
	UrrVMGMAoUXRwkgAWbM4mJE2wdeo4cXGbe+MY4qFZB3yYWQ04ST8BhvPsIQ/nBvgXqOkipegx9i
	hvN/zFcf6/VbWBlnJCYKjLlpcMR1l8UERUP+t5hIF1zt0osBQ4IhAsaNeIOCPWxKhfbgOhSH1vM
	SiCsFA7azzAn3WpXNCJHwxy7UCnphqO3G5j8V7p8A8y6r62V4Dcv1DTEeV1vL1jwp97qit0eRlE
	GOK+rulvfl0mZ
X-Google-Smtp-Source: 
 AGHT+IHfFeGKwpSxoEw7wvWXxXuhPqYFWR2DZ4U1jG2+RFCEMUW5WfmNqx+EbqNMnb2jRGTfm9cGxkYPIXaNkpSitnk=
X-Received: by 2002:a05:7300:e9c5:20b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b17d06e857mr568526eec.0.1767781337368; Wed, 07 Jan 2026
 02:22:17 -0800 (PST)
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
 <38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com>
 <f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com>
In-Reply-To: <f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 11:22:05 +0100
X-Gm-Features: AQt7F2qX0fRX-1cI1u2SPHWZHP47yPTczxbJZU6ADBL-ZnLG8wR6-v9o-mgeA-o
Message-ID: 
 <CANiq72nTWoAPzqyqQNegxznSg64Cd+2b-Fb89fmOxKOjMHBu+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
To: John Hubbard <jhubbard@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7Y3GJSYWNZFGU6OIKUXHXLE4ZIUKM2PZ
X-Message-ID-Hash: 7Y3GJSYWNZFGU6OIKUXHXLE4ZIUKM2PZ
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "gary@garyguo.net" <gary@garyguo.net>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7Y3GJSYWNZFGU6OIKUXHXLE4ZIUKM2PZ/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72nTWoAPzqyqQNegxznSg64Cd+2b-Fb89fmOxKOjMHBu+Q@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 7, 2026 at 3:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> samples/rust (pr_*!)               29             6          83%

2 of these 6 are expected, 4 aren't (`cont` level follows).

I have had a good first issue for these:

    https://github.com/Rust-for-Linux/linux/issues/1139

I just added a few more pointers to see if it helps people
contributing, and also a link to your table since it is a recent
search.

I also linked our other issue about having a `checkpatch` warning for
this, since most (but not all) should be finished in `\n`:

    https://github.com/Rust-for-Linux/linux/issues/1140

and the patch that would be nice to review/test/revive to see if we
can manage to land it:

    https://lore.kernel.org/rust-for-linux/20250207-checkpatch-newline2-v4-=
1-26d8e80d0059@invicto.ai/

(Or we do something like our past ksquirrel bot which is probably just
easier, to be honest)

Cheers,
Miguel
