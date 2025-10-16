Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAB7CBADAC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5044810EB9F;
	Sat, 13 Dec 2025 12:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHSSKlEt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFC010EA85
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 21:13:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-426ed6f4db5so1410360f8f.0
 for <nouveau@lists.freedesktop.org>; Thu, 16 Oct 2025 14:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760649193; x=1761253993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
 b=hHSSKlEtmc076z7La1l/33xNDf2kudF25pLeF/HU9zOkc8QTaOduA8munFr8L/679I
 UZMsZJmA3kTrGnbOF6gqsB13JXSYUvCV3lqjrwM3A7G61nMdW4h32iIvaYaQg+2iDprk
 6Fxdhy7mONIU/MB451iVmkxMDWkYxRUZeu0yASA+m0pzOLr+NMMtx4vEFnZS1pCyYSz8
 cjKjykFB0ByX3upIMMSHa4GzvqS72aBku/hOYWMTraeNw0oZS2JAlXwKbglXnoc7Wuoi
 EfoxkoWQbypOVMY8Ii64JzQZN1xb/gbqhVBcsVTPwrongUMcGWWz4jdmX52zlLm/N6xe
 pFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760649193; x=1761253993;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7dC9s7DUHDfq+JM4myzAQqHd029NncsnmY1lMtLvU4=;
 b=VJjfvMZHV0teIg6OUbNFnoN/OCq+khAlO8JkmPiN8GKY3qlag4/Somyozls3QpuQOy
 nGgIJsGWKiI0N8fgErzI7WK4aO5DUh6rDo3o/NyZC8wRp+heonTJVDEv1V5hxYKU7wly
 cw9eKVGzUFDLVY+w6ruEy7tGWFO+/V0lwuYHWeuTasJgY2NuDTKRFN+sWD7VPWY3q1ji
 URxt9VT2c3+vnfTef8lXDjHnNnBJ/cv94DzoZJGKzNhOSAtCg3tgCakSpZSJstaSfZq2
 r013xl0CFTS0ORWuKJNy0wnQ/hmkX4oi6c0lB2/SGN27KdcBZvm4UKQtv5N2ZjK4C0KO
 xTtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMSAASc/bP6v1griXZKmNabtAM2g73q+j6gNrBfKmbfhsMvYvaH5c9Bw6VLqKXusl9E6QeTJIt@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpXegHey6TBA5oDjxB3fAtRWRirdTWvLulTMi71NUYup8q592m
 8tIDY/Ts0icnf2b58PWzj0DmNO1f919j+0fJq2GDN1KA0zIyDhQRZ5NI
X-Gm-Gg: ASbGncvOV4gvz3yyOPoqBrG25A0unHKyxLj1NJ6dovxZXVdm9MaYpzYGbYHjMHW80Hf
 WPk7GHgjHvzGqLNvU3c4yyBFMstuOY3MyTMgxnrZXN/cWbwbhWYTwmD69Sbmsklh/GwuOgxaf1B
 j+S/iAAGhdDp3+xTOV3l8Tc0G4cN2+N4KD/YdtHsHeFB2Wpth+YqOxqlh5vTvmnc4CRWmmrnmgl
 YnhjQudIg7DKmItsrVuMlT+bZHJucnuIYBy8c3TRTTqwpVoiUiXY6fHS09dNj1Z0ZBRhgqYSRRi
 /KAjEV3RZtk8kiyo5AadhDOtqxL53ojlYHj3dBgrJ3DI//AADwAhQYUu2k41vnZkwj2v0xCXtzr
 VC+mNqdV4nWh1SO3WVN5a+kD3o9TGtN3BbjNYPAy3OCG90DNGEL7JeMxuk3VCuzWmyRkw5FuE06
 VbPa7wIVFa44Xg1ZEJYicod4Aa85PsUOCZdAObROAsQylWaPMALUM9to2W7naFsns9dHjZ+AsBf
 GyItg==
X-Google-Smtp-Source: AGHT+IHKPJSTI0DmvT06VL4xwoZPAZid6jDY8psvVG06n9vCvu/0Q/oxZW5QmJcTU6PqNg2HD3zBYg==
X-Received: by 2002:a05:6000:41f7:b0:427:548:6e3b with SMTP id
 ffacd0b85a97d-42705486e44mr815017f8f.13.1760649192715; 
 Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:acc:bb60:756b:64e3:20ef:1d08?
 ([2a01:e0a:acc:bb60:756b:64e3:20ef:1d08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf6b4sm37077374f8f.25.2025.10.16.14.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 14:13:12 -0700 (PDT)
Message-ID: <21944b18-ac36-4acd-9d36-cc05579acc0d@gmail.com>
Date: Thu, 16 Oct 2025 23:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Language: en-US
From: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
In-Reply-To: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

Hi Danilo,

On 10/15/25 22:04, Danilo Krummrich wrote:
> Hi Daniel,
> 
> On 10/15/25 9:49 PM, Daniel del Castillo wrote:
>> This patch solves the existing mentions of COHA, a task
>> in the Nova task list about improving the `CoherentAllocation` API.
>> I confirmed by talking to Alexandre Courbot, that the reading/writing
>> methods in `CoherentAllocation` can never be safe, so
>> this patch doesn't actually change `CoherentAllocation`, but rather
>> tries to solve the existing references to [COHA].
> 
> This patch seems to address two different TODOs. Please split up the patch
> accordingly.

Sorry, I thought it was okay as they were part of the same task. Will do.

Thanks for the other comments as well, I'll apply them and send a new
version soon.

Cheers,
Daniel

