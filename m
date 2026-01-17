Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E129D38EA5
	for <lists+nouveau@lfdr.de>; Sat, 17 Jan 2026 14:24:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4035910E09B;
	Sat, 17 Jan 2026 13:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ZVTuO+/F";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7E2D544CA5;
	Sat, 17 Jan 2026 13:15:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768655725;
 b=j4TpjRTg0WqP3CnpEbDGFdIOGWbbu8LTy4GWCj3nWj7QB9nJRGGrlI2b0qHt6D4PZBavm
 tL5xupjUnFrxm96y1wtOTY2Lp8S6l7qnq/4pABeqXN1WgjIrPmdOABmWl+oZOrzjTESIGpZ
 NlvvSlbneTZdwjs0XxfIe/64ROnNrA4rIq/YB/vU16C23rTdBYfxnLfJn6cmUYKZqTa+ySC
 RUXCwdtctt35RrsfQPCtd4IaMqsKK0kYYaravGXIji68+7Lkk71ji8ignyN2SSU5sO0DX+n
 1Tc4qlDwb3LhDEq1CudY88ZV+eeTjLBCISgeCaKTph4fybfw1NzA051BFPWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768655725; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fP0C9/mdoawsiTgfKMSE2aqwxjrv7ADD8bBCZi3o7ok=;
 b=WEGMH2Ov5fEM2wtY6RwC/4zj4+eYfPHgG5vjU/IHB687EngRrMyq697c2K6gNT7S09H8z
 yYZawRXgHBs/ylyzjuSO+wI4v+cRNoqHGNt9A+461/ftyV9CUJZiy9rnEcsjwACNtGeFAlT
 j/tSpsYMmr4jmzq0nj7RQ6ijdQxHvc8rvc+xlwgPqTdnjzNdj9zLz1UWJVnO3AwP5xUAcz/
 o8YY66Qak7jna43n720sgdPV2+OcJaUFaAi0wtyUcgv0+LjsVxQx5RStmVtxyQec1yJcA+o
 wswa/qBfYJav2IOKOtZVrFKy3QfOIuaaZrAyyAOz3Go+Ae1vXDK/omQGUBgg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1878B44024
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 13:15:23 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 874C210E039
	for <nouveau@lists.freedesktop.org>; Sat, 17 Jan 2026 13:24:00 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-47ee056e5cfso29303025e9.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 17 Jan 2026 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768656239; x=1769261039;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fP0C9/mdoawsiTgfKMSE2aqwxjrv7ADD8bBCZi3o7ok=;
        b=ZVTuO+/FB5tv2RQSJ1v4ymlfPiCvtx0kaF71WXqAfS5uXtdF5uP3CknjgbxNVwLncs
         BH8Q4GVR3EwJoSBkMvBwndz8HUPyzoLYjco25yhBTDFj6vejiwOccEBeUq6gS14puGdH
         iM5uxZIV9JIZi/EUgmFnqIRSWiNY72K/PEduOtGJebt6wVaN3sAOIPKKmICdwwJOpwqy
         zu8dsjsOJj5kHfRNHPjyDM0W8VRIvJB9ytJiPW7HozVTUBmIFGVrr6ACayBM8mr+zM59
         mzOLNs9SXypOJcogH9JASHYBM2UUxBgazXZBuQbxwpnGNN/MEhDh/b022CP7Tes5FVWg
         JzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768656239; x=1769261039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fP0C9/mdoawsiTgfKMSE2aqwxjrv7ADD8bBCZi3o7ok=;
        b=Lsh/xZoDTqWjnmVyvUN2jOws2ZHya7q7p8w3aUBL4Zf3bHBdQEUiSUQPZU+x8oHlYI
         hjSJaV4UvVXhhkvcIMnkjjosEMRXouYPzBLv72Ue3r85JLnfobp2LZwj8rHa+cjNQk/I
         iHaQaVHpuPFNc5BIaZ/dYiz8swADMt2aZ9xf4MRTSu1wJe5KfwlE97t6BplYGOQvOqOQ
         gmRysYslu36piJvSKR6NRXEKMyaqnUj46y4tQF+FyRdsn2Bx2WkcDJZVfiPsCwcq1od1
         j4NIqPImcrY9khpUiPvk9pt1JaMu6Zh/fJNldnmVOLPD1C5CPKTyRXzrkz9x9E7mxTiP
         pmxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuIsaXy/Ies+NLw7/jZyAjTCuHFO8rNZcRikzmjRJtHuKywwbhkzZLzo9OxwRjKQ/vXi+zTHyE@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw04bpEMJWlFXyVtMeNpngTDz2EgKBlYah5KoXLj8zXjcegKeza
	IRu2hU1gyc00ggKTb80Aq4FmfJts0y9ofEtSKnNL3TeBEXWnUfgKhO+CgnOlAvSQQcS4iJRoPxu
	CCOu3EcZ140j7reOPIQ==
X-Received: from wmbej6.prod.google.com
 ([2002:a05:600c:3e86:b0:47e:df88:7cfe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a1a:10b0:480:1f6b:d495 with SMTP id
 5b1f17b1804b1-4801f6bd602mr49343665e9.32.1768656239044;
 Sat, 17 Jan 2026 05:23:59 -0800 (PST)
Date: Sat, 17 Jan 2026 13:23:57 +0000
In-Reply-To: <20260116214959.641032-4-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-4-ttabi@nvidia.com>
Message-ID: <aWuNbUywGRH1zo-0@google.com>
Subject: Re: [PATCH v5 3/8] rust: uaccess: add UserSliceWriter::write_buffer()
 for raw pointer writes
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: NCTI6SZ4FNME75WA64SI2UFRYPYEJLBS
X-Message-ID-Hash: NCTI6SZ4FNME75WA64SI2UFRYPYEJLBS
X-MailFrom: 
 3b41raQkKB4oozwqs5Cvzu22uzs.q201289so8zw676.t5ssrs6y723.25u@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NCTI6SZ4FNME75WA64SI2UFRYPYEJLBS/>
Archived-At: <https://lore.freedesktop.org/aWuNbUywGRH1zo-0@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jan 16, 2026 at 03:49:54PM -0600, Timur Tabi wrote:
> Add a new method to UserSliceWriter that copies data from a raw kernel
> pointer to userspace, without requiring a Rust slice reference.
> 
> The method takes:
>   - data: raw pointer to the source buffer
>   - len: total size of the source buffer (for bounds checking)
>   - offset: byte offset into the source buffer to start copying from
>   - count: number of bytes to copy
> 
> The method is marked unsafe because the caller must ensure the pointer
> is valid for the specified length and that the memory is not mutated
> during the call.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/uaccess.rs | 50 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index f989539a31b4..8bbb0084abb1 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -481,6 +481,56 @@ pub fn write_slice(&mut self, data: &[u8]) -> Result {
>          Ok(())
>      }
>  
> +    /// Writes raw data to this user pointer from a raw kernel pointer.
> +    ///
> +    /// This is similar to [`Self::write_slice`] but takes a raw pointer instead of a slice,
> +    /// along with a total buffer length, an offset into the that buffer, and a count of bytes
> +    /// to copy.
> +    ///
> +    /// Returns error if the offset+count exceeds the buffer size.
> +    ///
> +    /// Fails with [`EFAULT`] if the write happens on a bad address, or if the write goes out of
> +    /// bounds of this [`UserSliceWriter`]. This call may modify the associated userspace slice
> +    /// even if it returns an error.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `data` must point to a valid memory region of at least `len` bytes that remains allocated
> +    ///   for the duration of this call.
> +    ///
> +    /// Note: Unlike [`Self::write_slice`], this method does not require exclusive access to the
> +    /// source memory. The memory may be concurrently modified by other threads or hardware (e.g.,
> +    /// DMA buffers). In such cases, the copied data may be inconsistent, but this does not cause
> +    /// undefined behavior.
> +    pub unsafe fn write_buffer(
> +        &mut self,
> +        data: *const u8,
> +        len: usize,
> +        offset: usize,
> +        count: usize,
> +    ) -> Result {

Why not this signature?

	unsafe fn write_raw_slice(&mut self, data: *const [u8]) -> Result;

You can implement `write_slice` in terms of it.

Alice
