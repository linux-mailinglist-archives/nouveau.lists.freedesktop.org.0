Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A8CBF03B
	for <lists+nouveau@lfdr.de>; Mon, 15 Dec 2025 17:49:19 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B96610E601;
	Mon, 15 Dec 2025 16:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P1aFYKtG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BDA2045553;
	Mon, 15 Dec 2025 16:41:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765816913;
 b=gdkKWFkxthyTHEj2o+wqKAzYZPfetMhko5+KYnQMpx9Q7fYeH0GDXbdCaVTN34X6r+Mui
 NLhKUJOxorD4aroNtE73UqBDT4bMajqjc1zXGTAUSa7gYNIM/763rRH5h3lX4Jpvwwvwhn3
 Vv6R83RHkCFncDCJBpXMP5u8v8RCIFa+P6xAJ9k+L1vzmnaBxqsT1TxI5aAItnjL7oVQqKi
 SyQXKY6MIIKKySoEGgBAPiFDY6eDPplUvYBPaSlrELKucz13LrdctIjSIsZgaFKw5MyLzJi
 SHs8PqMbRsQETiKtLRGQs+TBqEBLOs5rmPfOGP3uTtz77fuX2ln4qdRd+qkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765816913; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
 b=ja148SzAUBLD4FT+bXsBNynUWA5kdIWKarSoMIL/Rodj0/Tlm9c0MwrTkKfbtCYbfxUa5
 AX1kT1qNGx+NrFgug7iLcyYrMz+Qg4bmHrNzX5jepk1C7IsbQ4FGfqlgpLol0Z/17b7M6T5
 vCcIHSWewkv+JiEkMgOS2hP+WG3zQnUMpAoqPtRuDj2lwh4+WHFWoOpbCmT68JjUVWsEpBg
 LyI/aevYeox1gQeQ1Sz2PuoE8yZAMtoIAuIigrbOqP1419jFQbJmqQ967aDWfeCCD/IrW36
 L4o5VodHMWi1dlo1/LYBogOY5dqabsLwdFEACuLyRAZ2Vc/taVd8l6B6k3Jw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 81A9C4551A
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:41:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB3D10E58E
	for <nouveau@lists.freedesktop.org>; Mon, 15 Dec 2025 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765817353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
	b=P1aFYKtGPjB2UssT8OPAnsSgpXfFwplgu86zw19GGjKUyShX7IjBSUyz30wzuHgnN5s5cC
	d4xtbjgSANdSVpRD2t0dO5hot0Hvm9cziATchDvQVsCdE/dCkfHLDih1WKnLkvYZAHoYL2
	8zoTRBLLJprzLcUj3eHNeoyyy+uYQnU=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-U18e_IWGPm-WXRcLkn0zxQ-1; Mon, 15 Dec 2025 11:49:10 -0500
X-MC-Unique: U18e_IWGPm-WXRcLkn0zxQ-1
X-Mimecast-MFC-AGG-ID: U18e_IWGPm-WXRcLkn0zxQ_1765817349
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c0c7e0a8ac1so6049076a12.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 15 Dec 2025 08:49:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765817349; x=1766422149;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=90eSrAVeTQt1LSlA7rLADIe1RjnPjiLd7YkjkzDUFBU=;
        b=nZrsQFnxC0G9NyJXtRYS9ccgiCC9f8J7wP+UwrOBLK7qAAn2r/ro3HUKPFRiydXfyi
         LB+RuvruU52CZmawK/cat5o4Cic8Pw9mNdgXy0DBrezeHCQqsrxgyNXhscIMz3fs9qak
         z+H4QUs7GWzHFyx5hLq7p4BSokK4VInr1SwK9Iky4ssvdTqQ8b1yqCyo916pesrfpUMO
         K77QwHUDDbyQuAKuEAHvnFyJjMlUtY/V2bfmL4UGmUAYe45hRH/MiCXncw8/QtjKveBd
         cS0MjBJlDst96PVThcGs43fFTlXXpCHvH43D/se3kF88YpZaYql8jMIxVQ7BAy65SWB/
         vGxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGHDYO3OCmyUZQ5kI+fkk2cwpkKKBUNy3oQvR5nc4GOthXOgPAx4hsGaMYql2/MzWL7CZBV6nP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yworxc5VO8yJC5fcKRumaFmBG4oq2+rs0cHpKWt0AHrrdctDQYj
	T9EXBmwWxOBjvTvXuNK7oU9nirbXWGqAdKymG52nb+qAQ2XF6rKMytf1AoaVUgb0ly10Om8odZZ
	as6FdgEtoMnT2SqnTrcp6uBYGvGscbYbK+W53QH9SglPZCsXCcuwxvCm53pVf85DBV2c=
X-Gm-Gg: AY/fxX5wi50uUiQC2Wgmxe4xjlBTo26wIF6Ev8zspn8IohkQgTtXh+cvi1Cd9OUkcid
	5EIWAEXIwVLZF5PqF+q5tClPYUzrpjZhANEu+cawYuwhxHIY1aDCX0svxhsyJHvU9fdJg7YZmIO
	4NaemkCRvetqQ2o1TWWHNZwt/z3KzQNKnvxj8ToKBZPAKDYlCmfdnwK8/76h8lGVSya3vCSRnra
	N46q6sgayFKCOMhdGbYZGuuuoQpV3fXz8999jdl7F2y7eXKv7CHggbhQr+XAus6XPdDI8iXJ+/t
	XuqtctI8QoZw7TGlfvgATRKh99usOpO3IgeXbIYl0teLn23kFDblQiL+KrKv48pNCvf7u+ATJ/c
	A9IxFSWsbJQo1URfc2dAjr9rFtit318qqp8UhAt2K57OP9n8cl5pkcnJYPIAe
X-Received: by 2002:a05:7300:c8c6:b0:2a4:3593:c7d3 with SMTP id
 5a478bee46e88-2ac2f8e6567mr7849995eec.19.1765817348896;
        Mon, 15 Dec 2025 08:49:08 -0800 (PST)
X-Google-Smtp-Source: 
 AGHT+IF9ywBhO+AjyorN/QYLDdR6ZuyZ8MLKsTGfFQn8LxsH9eQGPESUJaMLsKCapR70wm46Nx0uBg==
X-Received: by 2002:a05:7300:c8c6:b0:2a4:3593:c7d3 with SMTP id
 5a478bee46e88-2ac2f8e6567mr7849968eec.19.1765817348330;
        Mon, 15 Dec 2025 08:49:08 -0800 (PST)
Received: from [192.168.8.4] (static-96-233-112-129.bstnma.ftas.verizon.net.
 [96.233.112.129])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ad44110517sm15225311eec.5.2025.12.15.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:49:07 -0800 (PST)
Message-ID: <f0ad76f8e6e044f56f86d39718843f838b5a8be1.camel@redhat.com>
Subject: Re: [PATCH 1/7] rust: pci: add PCI device name method
From: lyude@redhat.com
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, joelagnelf@nvidia.com,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Date: Mon, 15 Dec 2025 11:49:03 -0500
In-Reply-To: <20251212204952.3690244-2-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-2-ttabi@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZT9BnGU8D6NgNDvK3tIF3RgemyY4DwsUd9oqPwBCxu8_1765817349
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 526ZW52ZI7LLXUWHPQV2MAPV2BNRTXEC
X-Message-ID-Hash: 526ZW52ZI7LLXUWHPQV2MAPV2BNRTXEC
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/526ZW52ZI7LLXUWHPQV2MAPV2BNRTXEC/>
Archived-At: 
 <https://lore.freedesktop.org/f0ad76f8e6e044f56f86d39718843f838b5a8be1.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 2025-12-12 at 14:49 -0600, Timur Tabi wrote:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `struct pci_dev`, which co=
ntains a `struct device dev`
> member.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let p=
ci_dev =3D self.as_raw();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let d=
ev =3D addr_of_mut!((*pci_dev).dev);
> +

JFYI - addr_of!/addr_of_mut! shouldn't be used in new code, we're
moving to using &raw const and &raw mut respectively (which pretty much
do the same thing without a macro).

