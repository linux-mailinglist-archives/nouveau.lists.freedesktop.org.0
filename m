Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A170CCDD79C
	for <lists+nouveau@lfdr.de>; Thu, 25 Dec 2025 08:56:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16F8D11ABDB;
	Thu, 25 Dec 2025 07:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X0QskgP9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1691944C67;
	Thu, 25 Dec 2025 07:49:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766648948;
 b=cQHPAoKxo/SOFTx6ZSGuxLihv/7Vkd7yMm9aTPLuYFfTRwidNAJdPvGtrdYSC5tTQ29X4
 fPiSU6nIDVVIGu5sgT2J2izuL7KthjcqI+f33/qFwDAFszX5b9XMeetPumbk8FpMySwZlMq
 +pD3OhyWrup5LITRc6FzxLAvIIgHpMfGIF3PTxi7AtVzfDKecILKGv/bDniA143oBpqF/7B
 dKm3RTCIlxDUzD7lOFYAxiTOt4iMcNRpRrGL2zwCYoeKJBON4Hh0bDFXVl6tw2w7jBbEhL0
 d+reVUlOnl5P3rV5FAHCQNjC3Msm5ymO738Cm8fZbXgGWbcf62CFJxLPGYwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766648948; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
 b=sDLKizJmH+RLKY71ahBxXdNTAT4A71t9j+K8vzEfEtsdNyqizHkaAHaNwezZ+ZZGN9963
 Z2Yn9Bi5GPLLLehivJwPinIWA85y7cMytTezV3kgvbEYmTl4sZjZLGM5mBktc+RbcxlQ2U9
 9gytM/sE3hx79QGY8kZag7+yRJL35yBrC2dLPiRF76OWq9rGQMNa3Bcb2XJ+cy5P2YZQOh0
 XQ9Bpr6CSYbB1OKerzCq5WpGBrA9YzNhkEiK1j+/RtDxN7hZ7XR4r5H9RnPhOFMPTr9nr5X
 +xUEAvMcuEVIA5ZHxo/uNU+tnT5pZ+uvqP3qkAZ3UQMeC/7ndEMdhvoEOM9Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8FC5644037
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 07:49:06 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1DB10E15B
	for <nouveau@lists.freedesktop.org>; Thu, 25 Dec 2025 07:56:52 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-3ec46e3c65bso5006964fac.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 24 Dec 2025 23:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766649411; x=1767254211;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
        b=X0QskgP9RHwsxwvVh8N6IPGv961e9fghKXteT55rltZWvGVhOXbxSaA2iDMLntidj1
         tpgXTYCqya7LUgmVV/lfJwGxFHf9ZA6+6DTqkzhq7j16YKtayIHlOgCRw5myQ1EhoPGq
         LjamaUWfyUlF0eDzitTT6STVfgDp55+Hihgmdg7/wqVtQviEbD/linPAOdo45gEKGl6s
         cIWcNKLWqL/Igfm7xflG9eEa4PHQoidE1RsBMg5ywKrlxnp8WgGx4xI9yEHC9vIo6gd2
         MhcxFWxZOuyejRehCyGaVuHLGWiO3GtwstoLUUekua/neSXO6UvIEzYFFDlQVoSCdxj+
         8JWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766649411; x=1767254211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jkb7kGbg83vVfRQBzRktntKWITXsGXoxh8aDW2gaq4s=;
        b=rDrU0bJnwhHfTfS9bH9JoFN6RBxeE7Pi1KA3AplVwVyLk6PqK2lMFwnEtbgJ/YJo+4
         mJXdZe3XxS/h1D3mYXc1RZ7w+8jUZZo8/oigrznuBCK2fJseCNRoKUrUd+rdEiJy6g+L
         T9PVZaIlJvA5HNhFuCTFTE091JS0WoivLXrT8jUmXDJ4zIWmrG5ilNFfLFoVDIHxGV9s
         ZbGU7Bw/rvocHDXe2EeXWqvxm9QsjFvgLsNOzbDGxdnb2jse3i4ZEB9y1pP6SPmn2MZ6
         afQAqBDNsN7T7RWZzpl1oScHKJfv57Vevbt3YqqV7Z+4PuSLyk642Cf3FAz7w0Q3iagz
         CpcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRwZKFued3sMZC280dmCEUxasCqj+Es3QPd2IUNHalkqLhNG12hRkGyb3cQi1bv0Z/9m6HEJSB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVPa0fPgVd7TL6z/dMN+BKjSnrgLOnsu+j8FMb3BoV1gHw22O8
	gDzObTWwmLK4bEeuyt7frixfYDyNhRZvV/p2O5CO3xdNGACgGFcuV5Mqk8Q0c0kN9cWu4YJEC21
	nFjoQqaL3uYkL1izGcUzB4P0NGZrtkSo=
X-Gm-Gg: AY/fxX5O8d2gO3J4hq2D+ojQZuRkdL3yzVP0QRTAOI+BL18AaL9O9w5DpBQINjPe/xx
	eamLw9njKSUmT+iSHzLtpC5kpvmAt0dcr8o7W0krVS71b67GZhu5crSiFWcNpQN3mD6Xe+ZUOYx
	6dPI6SeyHkhMwrUvgUaiX7ZLAXXxCN2tRNv56aUWlBrjC+M6gjGjxDM5aSykWo1d2+NwZemajmT
	Z86/4gAZpONYAM9vtRCXmXt4JxuPz5+tFnQFkoU6XxWm6qAHp9kLLxmTJrgJLE8iZH9QNU=
X-Google-Smtp-Source: 
 AGHT+IHjjISiJB64hPaDzLvcDDJ1oFaUtkQ5hlp7Bgc2Mtq04qc4sWgRQ3cAw2CDCD0iKzI/6zYZU7KrXzFALJsjnbo=
X-Received: by 2002:a4a:db6d:0:b0:659:9a49:8fbd with SMTP id
 006d021491bc7-65d0eb309aamr6233965eaf.54.1766649411188; Wed, 24 Dec 2025
 23:56:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766544407.git.y.j3ms.n@gmail.com>
 <DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com>
In-Reply-To: <DF74FEXHESCV.3L0KB1DLDMFTV@nvidia.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Thu, 25 Dec 2025 16:56:40 +0900
X-Gm-Features: AQt7F2qc1qa8xEDR7xtZ51CzGnbsA1YjyS535MDQSLxKRj43RK8il4FSew6ZvRM
Message-ID: 
 <CA+tqQ4KpWmjJfgBdphraHJrxDjp5J3Tq3ZN-o54wBUNpij5dOQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: add `TryFrom` and `Into` derive macros
To: Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QDHRFCJMQ5MD4OED3XDFJQWBMDAK3WRO
X-Message-ID-Hash: QDHRFCJMQ5MD4OED3XDFJQWBMDAK3WRO
X-MailFrom: y.j3ms.n@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QDHRFCJMQ5MD4OED3XDFJQWBMDAK3WRO/>
Archived-At: 
 <https://lore.freedesktop.org/CA+tqQ4KpWmjJfgBdphraHJrxDjp5J3Tq3ZN-o54wBUNpij5dOQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Dec 25, 2025 at 4:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I'm really looking forward to reviewing this one, but for some reason
> patches 1 and 2 appear to not have been sent. They don't even appear on
> lore: https://lore.kernel.org/all/cover.1766544407.git.y.j3ms.n@gmail.com=
/

Hi,

I'm having some issues with Gmail. It's blocking some of the patches
in the series [1]. I will resend the whole series using b4 to avoid further
issues. Apologies for the noise.

[1] https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/5652=
66787
