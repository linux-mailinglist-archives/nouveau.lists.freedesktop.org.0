Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D79CBAEFE
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BD010EC59;
	Sat, 13 Dec 2025 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ox4nF6vF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B5C10E599
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 10:07:02 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-297cf964774so9678575ad.2
 for <nouveau@lists.freedesktop.org>; Wed, 26 Nov 2025 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764151622; x=1764756422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
 b=Ox4nF6vFIU1SFiA+ulQbztcjUdRgx6ug80zflZQ7zXolKc/UvudWlp2TKkva14enYK
 cAH18rKKK6a7h2RWr0jw45uZHpPs2/RGRpJGiS9wjC5l5awiE8xadJsNReINvw9DDS07
 nRsM7ilyTwg+UQZVopmoV0kJVU4ujKhUW6MRKot7uRrtyMGhmDSf78jqKXtXXCQio5It
 aueLzGTKy+i4jKf5ZHbp80ZvzuMnNIPeARb8LII1oi+J/H9HExTI6lxgk0RTiCn0zKwJ
 CR6vdFZriDFbKojUggbbPzVUNa6En2xyZeJKf3BmQqs31XJhYLFQRPlsEochLszwJKJ2
 OXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764151622; x=1764756422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e2P97JqJJgrSTofOE6L0Vqzh5vWI3dfXbDRlEdNGUic=;
 b=xLE3/9euAtTZYpnKNO2cXfbp3W4fYI51v+1JUehckDmBDt7OOtdE6sGhwmOdoY7AEY
 tdG+LgbReNSp5zwrW/q+Oed3K671nJoxQY4TrzCS/LelCVeQm9oBxRSTi8DHbztYYw09
 6V9WIsC+u28UXjuaJnTAhJZNc9jxSvcNs9RNze6Xld0oc87iGNkMbvs98qKc6n4pAdND
 NyO0ah4ErXndaIlWD2eF3OZNsV55VifRJUJr9CMlafzZpQOwcuhtuh/S+rHL9WveGNhm
 KaucBl5yglSZEZvXsDp+mVUibJix1jyPaRcPrUBxcvWRfZdHwe9gnd6B/kl5HmfvxTEb
 dI9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt4O/h0qUNc6pc/hFWUmdG3EHesTCUUlsCltsSTc0EtLDglwaXSQeJ8raha9l8OC0uMG305P3U@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynokzuI7GaQp8qT3NgLIhBa6gbubkQYUEaU96igfnhhZhnvBTS
 4tP+mf/G/I1Ph9P+AIXAfkEVvmLu802Gl2iZ4YJM91HG64Mr84foCb5IloJLj8QxQhRJSYu9K3g
 NP9bdaVNysNhITRU5uDBY6bKvfh5eQ8Y=
X-Gm-Gg: ASbGnctktkpsBUy6bqKh9fR62WEizfEEqPFOzgI0bTt0Ob1ms0Fn6PDqzk2N/1zpPhW
 0rCFeSToDdD0K0WHzI0MnWIeSawTRHJiSLugaH1XnJeABzen/hEbnS1nfCUXDAv7vK7RpKrdz8Z
 OvRDlQjT7Z/35PIREwJbdud4jd5itYcdT4p+ojnXytaB+tWcRDmIheuPTGe54KhkBMorOJiue3I
 6dReJ2iePY62wcv6Y2PDuw5C55rAAnQNJmJbQWzwmuhD+OFHz2q4Llm+jAbRHo+num+Y5D8j3m0
 AEWk1w+PlBGJ4vBIOYX1tj1fPBTXZnr/sR1VztTNeHlHf8PhtE0VDlOlRYdsLVchGrbpTVuK2ug
 8YLzN7daGGS1GPA==
X-Google-Smtp-Source: AGHT+IH2u/p6uuejiQdBn2FdTVRunkAVdZufiIm+sEmpf2szKbImscQ5SyGn12xniGpqStrNxFPmWHVbL4VJexNgqJw=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr11325693eec.2.1764151622004; Wed, 26 Nov 2025
 02:07:02 -0800 (PST)
MIME-Version: 1.0
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <DEHV08MPF9CH.1GZAWEGC4AVF3@nvidia.com>
 <095D38BD-A8AA-4BC3-8C24-9454964EB8F8@nvidia.com>
 <DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com>
 <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
In-Reply-To: <540391dc-caaf-4ca9-9729-e3147bed3100@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Nov 2025 11:06:49 +0100
X-Gm-Features: AWmQ_bkhJWTAVJBxKsZu1t81P67sTZ90hu6KhDzqOUDEKCI0FkxUuBERQ_mEKds
Message-ID: <CANiq72n0mW6wSWvk4=R41BK=RWbpeXXjea-c1FZMs8y3sE6bug@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, Alistair Popple <apopple@nvidia.com>, 
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, 
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>, 
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, 
 "tmgross@umich.edu" <tmgross@umich.edu>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Timur Tabi <ttabi@nvidia.com>, 
 "joel@joelfernandes.org" <joel@joelfernandes.org>, 
 "elle@weathered-steel.dev" <elle@weathered-steel.dev>, 
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, 
 "phasta@kernel.org" <phasta@kernel.org>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:48 +0000
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

On Wed, Nov 26, 2025 at 2:39=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Yes. I am increasingly uneasy with the Rust for Linux approach, and
> now the Nova approach, of adding in "things we might need".

Excuse me, what "Rust for Linux approach"?

No, we do not add dead code unless justified, just like everywhere
else in the Linux kernel.

Yes, there are a few exceptional cases, but it is just that, exceptional.

Cheers,
Miguel
