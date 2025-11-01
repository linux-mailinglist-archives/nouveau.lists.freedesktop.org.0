Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25471CBADA0
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAAC10EB76;
	Sat, 13 Dec 2025 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMtQk9up";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BAE10E166
 for <nouveau@lists.freedesktop.org>; Sat,  1 Nov 2025 18:51:21 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ee15b5435bso2311955f8f.0
 for <nouveau@lists.freedesktop.org>; Sat, 01 Nov 2025 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762023080; x=1762627880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w0yBSAofgQOyjuw5PvpAMID/+vYPOzSWVbrrAKxMhQU=;
 b=JMtQk9upiDS96cpcwPwn2L3Xu+MRvmWeonRcGkQCtYZ5IpjqI6HR+x32tqYBEfjOR+
 7aO1KkI0Qj4MTlRgCAeB71VOToNAX9czDWp1qpnzcW4KZFc46yUIbaMBnB8Ccos8Qy8R
 zUprXh9EhZ8sjt42dHwfij2UvfXqXHjEmPQum3XFcSro+1UJ+9g0i96C8kDhsNtlGGDk
 +FX5XC3bCsALWZg4yU0XrGWfG0BE3vvLSURRFUciiN849fyEu67kWXRP0YmLsG3WD3Fc
 f6qIZPnhTcH3fOnGPBDH+vSQrrdhKj4AheJW0TlQO2/l40cek55A54OmmR+1DLNpsf2f
 wnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762023080; x=1762627880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w0yBSAofgQOyjuw5PvpAMID/+vYPOzSWVbrrAKxMhQU=;
 b=DfIw4e6lCaa+pI4HkGaKg8XMiOJc2/31mvF4RQWk3bWZS0czlPPeERRMh6R5KPOZmi
 yqiICL3k+IebdWJh+D9DAuS/nUlN9T6ylEQsSd4Ug/DRCJrMo5f/CMAnpduDKWYN8LAA
 3lxBRVZGCV1xzefhuXhg9VMBYB3+lM+nmaROnwpyVv7dJpBvxB0zbhLKZVWops1tQztr
 1ftFiVqE5HkXRroy5hzNbe2/ERArBbNW0WJnnRBfcSP8gzqFK3UHRcsyQ0s7muiHNZ9g
 Pv4HXtN/aSjFyWmBxzLHWfhiFtPyhs/RtatfnyQktWpnge3qHlBWY4V0ioyoKhhr3DfX
 j79Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK20QpUwe/G6mg+w9Kmj0JpBvS5bNIeP8rnWEnUASEQFRYcmVBKrfoX/+rwLR39g+b3GMHBUq0@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3m/WikeKgxu3ie2K440WOz6R7Youbm2bmO2SawAKvhHsxvT07
 EUhNdRjDLHpPJ1WV5wzOaSiIOYrhqVy8gL8RdosvlkEMHPv8BTgZt74N
X-Gm-Gg: ASbGncusE/OZ00Ai13fjF2wE+qe2Vgw3gMtqwHki68WPRYKrP5GwrqpAYmLT2XxYpQy
 S051DHTBu6ccDPkGmDqMQyhaXEyDoFcIhGjXjnT5abP5NlKgJta/1CcjmIrW7G+WcqSodKFMxQz
 amQKCxNnUl+IbRdwrd81j5ch0PCNS1MmQCmrrmhEmuBn8fA27fu8G8F5GfCj58QihMXWO4rPT3b
 m1NIQ1yDsrV4QhkEe87+PVB1HVsOOhE9sVcCv/0qTjChvvSIZiY4fz7u93iHCUOTHoB7V5apQ+P
 6zZnmZ1GNyHwgRjYc1F+TdBoUUALQcbtFk0sLcLWRlu5DO74vk/jxyyjz590MCxEUHTbOuZOM7V
 5CL+jeGfYC9gl1fFCXeS9dC46QmYCJ/+QOBIIZ89yrgylwEcPmliJ2iWJpCL5YFe/hNTcI18Ob3
 XSPC4Mp0vS7sIWG9j7PVtcguHAx93Vo6B01/vAaZFbIfjvxQLt68Ziqz4Qn/P7XA1aF0R2w5S1H
 XQ695J46y1M+loHwiWzzNEGS4fj/7e2na7VtQtVrp7qaQ==
X-Google-Smtp-Source: AGHT+IHZnuzUsk099QOW4MOvybDJX2Pw811XdLL6RZyljGX0/ACMY03TL3YhEgmFs5GYLczbAtd9SQ==
X-Received: by 2002:a5d:5d09:0:b0:429:ce02:c883 with SMTP id
 ffacd0b85a97d-429ce02ca54mr2659f8f.14.1762023079376; 
 Sat, 01 Nov 2025 11:51:19 -0700 (PDT)
Received: from ?IPV6:2003:df:bf22:3c00:b24b:879f:58a0:f24a?
 (p200300dfbf223c00b24b879f58a0f24a.dip0.t-ipconnect.de.
 [2003:df:bf22:3c00:b24b:879f:58a0:f24a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e1d8bsm10360744f8f.25.2025.11.01.11.51.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Nov 2025 11:51:18 -0700 (PDT)
Message-ID: <7dd6c190-2598-4a68-8431-e03e41b276ea@gmail.com>
Date: Sat, 1 Nov 2025 19:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org,
 Dirk Behme <dirk.behme@de.bosch.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
 <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
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

On 09.10.25 13:28, Alexandre Courbot wrote:
> On Thu Oct 9, 2025 at 8:16 PM JST, Danilo Krummrich wrote:
>> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>>> Assuming that register.rs is supposed to become the "generic" way to 
>>> access hardware registers I started to have a look to it. Some weeks 
>>> back testing interrupts I used some quite simple timer with 4 registers 
>>> [1]. Now, thinking about converting it to register!() I have three 
>>> understanding / usage questions:
>>>
>>> * At the moment register!() is for 32-bit registers, only? So it can't 
>>> be used for my example having 8-bit and 16-bit registers as well?
>>
>> Yes, currently the register!() macro always generates a 32-bit register type
>> (mainly because nova-core did not need anything else). However, this will of
>> course be generalized (which should be pretty straight forward).
>>
>> Having a brief look at the TMU datasheet it looks like you should be able to
>> treat TSTR and TCR as 32-bit registers without any issues for testing the
>> register!() macro today. I.e. you can just define it as:
>>
>> 	register!(TSTR @ 0x04, "Timer Start Register" {
>> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped.";
>> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped.";
>> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped.";
>> 	});
>>
>> Same for TCR.
> 
> Patch 2 of this series actually adds support for 16 and 8 bit register
> storage.

Hmm, how to use that with the register!() macro? I mean patch 2 adds
support for different storage widths for *bitfields*. But looking at
patch 4 [2] it looks like *register!()* still uses $name(u32)? With
that it looks like that the register!() macro still just supports 32
bit registers? Or what have I missed?

What I'm looking for is a way to specify if a register is 8, 16 or 32
bit. Using the example from above something like

register!(TSTR<u8> @ ....

Thanks

Dirk

[2]

https://lore.kernel.org/rust-for-linux/20251003154748.1687160-5-joelagnelf@nvidia.com/

...
+#[macro_export]
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? {
$($fields:tt)* } ) => {
-        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
+        ::kernel::bitfield!(pub(crate) struct $name(u32) $(,
$comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
...

