Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC5CBAF82
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C64410ECA5;
	Sat, 13 Dec 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R8GOA/u+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2434A10E0CF
 for <nouveau@lists.freedesktop.org>; Sun,  7 Dec 2025 08:59:18 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37b95f87d64so30539281fa.2
 for <nouveau@lists.freedesktop.org>; Sun, 07 Dec 2025 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765097956; x=1765702756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5b12hRnRWv6onGjF90Cte/QEE3Sc5Ju08UGYaWm18PI=;
 b=R8GOA/u+C+ipEXhlsi4Mk1Kz2Y8qfTjg2ktLLqSbTmesNJtohY4SbOLUlQSDYwn1Yg
 vPysCFISESRCPp4ikQzOXfw4cmVVWEkfLHXzq92Xxuv60ByKwBR05qk6JhyQuBY457P8
 tvljWYsXfYlhg7uLYWswGOJMFschT9rfh6TYhobOmJWlZn2PXxW/0RHUytjTSMEHPLAs
 zXk7pVtUxWZROdlh1DobBcA1e7jr4lH9OfiTd2Snn7L6Whssmto1tKcbvnmB6/h9YHeJ
 PDG9b/eVI1KR7ndakLggwzSEbCC/lvrdrisWvRqm3VyTR8WeDmEihQZg+PWcYmHDniVu
 2l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765097956; x=1765702756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5b12hRnRWv6onGjF90Cte/QEE3Sc5Ju08UGYaWm18PI=;
 b=cIcZEXuQe/QeCx/i9/9/0qPyuPLQGH6UGMyEl08OcaSuwRLXtx4xl/sPCxNkoYM4BC
 HXQzkYOiOk2mgO+s84JUdiHiny2jpdkf2axzTpAIpJfdlxEWY/NV8XcXyrN5OzAmHHpx
 spMFFwxukgR1z0nbIalt4NDY7o3FtAhU5pH+2vVW6PN+MojMznUFv0CLohlf4fM30PXJ
 Ei2u5cHdJeXwL8/QMKYOrhezE9MtMK5fXUQUOT9d3xTSqaltNLU7ameh2NFD3cc9QJ44
 SNoOUDaNmpz98Yvfx7GATSaHsvhse9FpeeVtliIkWFDoBjYWGNqoswdB8wuJhnsIcs4K
 lL8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU90Zb4jz2lKKDS8dHCwYYRrCaQH/RCwlksKWko1Lt9Ls0gh1wbFRfQ8VtPzcKwQtTPotjwPf6h@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8tSWpN4zYzEeIDqWqIhzdCcOAenTc+Kmqs52gSMtNHdZejqLf
 M2YRLD6Xz0kvvKA9tiXNS+vhW3D4tNS2ixhKxjHL6evUFhngv2hkvTiY
X-Gm-Gg: ASbGncvmqekCR69I5w0bFllVZldhVsp1dtMU4s09ZoULeY3MQdPm9Zwik0z0RFex34R
 RAdYomGnvU27Pu1D4tRc2i03BJ9m8BgQr1qrdeEI4BQp57nQn0h7Lf+ngwzGJKRDm5bxRZwTLqT
 x4KCuxVRQXMJfpkVJDo77TpWdyMMOvSubLsS0EQN3z1SGdgLdnNGn9jXLeor/GRaXb21CwWNXNY
 OHZ9iub2YFMihBYYEyg1OQCNxAYIRnnaGC9KNIwpTtRZGoxUduCG19y14MMStR1ZXOLJZD0kZPD
 PH1NI4iWykFAYENon/V/EsP/tSyoPkZCW6k1GovO04fVIQ2OSuK9VxhpTqVaUnf+LjdM/ppVIwA
 Hud+W/QnsvBjJTDlhwhXOewR7RUOl+xt0XxkavToS9vkdEML4w9dac/8GO9Jq0awprHMpbf6FIi
 lKHTT2R7AbOIBhSpQE4BWkT+F9aBtm3BiyH2eXdZGXCcTzDwO7FWSoumSP9i353aaHd+2vH6BXX
 LWOTnioXYMuDZd8ymrWsE5RdTnVUF5t1yr2aP8EuumJ+u7UDGACaA==
X-Google-Smtp-Source: AGHT+IHkpbBEjUpSSNR6c1N0xrVq9kG40VYKHC/sRRQKwimb+t89Kzoar8J3mhxBoq7JhZtP7BsBvQ==
X-Received: by 2002:a05:6000:430d:b0:42b:5448:7b08 with SMTP id
 ffacd0b85a97d-42f89f094b2mr4983612f8f.5.1765091533868; 
 Sat, 06 Dec 2025 23:12:13 -0800 (PST)
Received: from ?IPV6:2003:df:bf22:3c00:1c42:64e:ef2a:93cd?
 (p200300dfbf223c001c42064eef2a93cd.dip0.t-ipconnect.de.
 [2003:df:bf22:3c00:1c42:64e:ef2a:93cd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cc090bdsm18354202f8f.19.2025.12.06.23.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Dec 2025 23:12:13 -0800 (PST)
Message-ID: <ca549425-e10b-4d54-aebe-278d90c8cb92@gmail.com>
Date: Sun, 7 Dec 2025 08:12:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/7] rust: pci: expose sriov_get_totalvfs() helper
To: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, dakr@kernel.org, aliceryhl@google.com,
 bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org,
 cjia@nvidia.com, alex@shazbot.org, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 acourbot@nvidia.com, joelagnelf@nvidia.com, jhubbard@nvidia.com,
 zhiwang@kernel.org
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-2-zhiw@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251206124208.305963-2-zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
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

On 06.12.25 13:42, Zhi Wang wrote:
> Add a wrapper for the `pci_sriov_get_totalvfs()` helper, allowing drivers
> to query the number of total SR-IOV virtual functions a PCI device
> supports.
> 
> This is useful for components that need to conditionally enable features
> based on SR-IOV capability.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  rust/kernel/pci.rs | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 7fcc5f6022c1..9a82e83dfd30 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -514,6 +514,18 @@ pub fn pci_class(&self) -> Class {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
>          Class::from_raw(unsafe { (*self.as_raw()).class })
>      }
> +
> +    /// Returns total number of VFs, or `Err(ENODEV)` if none available.
> +    pub fn sriov_get_totalvfs(&self) -> Result<i32> {
> +        // SAFETY: `self.as_raw()` is a valid pointer to a `struct pci_dev`.
> +        let vfs = unsafe { bindings::pci_sriov_get_totalvfs(self.as_raw()) };
> +
> +        if vfs != 0 {
> +            Ok(vfs)
> +        } else {
> +            Err(ENODEV)
> +        }

In the thread [1] there was some discussion about the `if {} else {}`
"style". From that discussion I "distilled" 6 options [2] which I
liked for having an overview :) Of course not all of these applied
there (const), neither will they here. And all have pros and cons. I
think in the end option #4 was selected.

What's about to do something similar here (and in the 2/7 patch as well)?

if vfs == 0 {
    return Err(ENODEV);
}

Ok(vfs)

Dirk

[1]
https://lore.kernel.org/rust-for-linux/CANiq72kiscT5euAUjcSzvxMzM9Hdj8aQGeUN_pVF-vHf3DhBuQ@mail.gmail.com/

[2] Options distilled from the thread [1]:

1.

if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
    return Some(sum & PAGE_MASK);
}
None


2.

addr.checked_add(PAGE_SIZE - 1).map(|sum| sum & PAGE_MASK)


3.

if let Some(sum) = addr.checked_add(PAGE_SIZE - 1) {
   Some(sum & PAGE_MASK);
} else {
   None
}


4.

let Some(sum) = addr.checked_add(PAGE_SIZE - 1) else {
    return None;
};

Some(sum & PAGE_MASK)


5.

match addr.checked_add(PAGE_SIZE - 1) {
  Some(v) => Some(v & PAGE_MASK),
  None => None,
}

6.

Some(addr.checked_add(PAGE_SIZE - 1)? & PAGE_MASK)
