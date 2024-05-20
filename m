Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF628CA164
	for <lists+nouveau@lfdr.de>; Mon, 20 May 2024 19:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9E010E1E7;
	Mon, 20 May 2024 17:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EG3sBb/S";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B153910E35D
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716226228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
 b=EG3sBb/SMJyvMcXfMXK3Cscco1BGLSd1w5rxoTgtJJOQ4msIOSB4xhye0No29gDIIymN8G
 3ujbdX52AJtSUBuhxUuZj0pqE2qEiqi3yLH4D6k06Y/GCxCren9xCTSoDxz2sHUFs/KtML
 n3F0OmT2eO5q/TdFQqirjpn1BOUm2x0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-pvOE86cPNWOdbwE10A7Mfw-1; Mon, 20 May 2024 13:30:27 -0400
X-MC-Unique: pvOE86cPNWOdbwE10A7Mfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-420061cf1b1so44470825e9.1
 for <nouveau@lists.freedesktop.org>; Mon, 20 May 2024 10:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716226226; x=1716831026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEiGpueOgc8AoSq/Mo1H+WaHd62XVwbqvhNsyZDlqOM=;
 b=MkV5FG1yOCrKVHrrbJl/fqqNOej28+ZUZLeNhKjap19Unq6cr/HJLM66Wy90gIJZTD
 rTXCjs+EoWEZ+Fdt8GqhYAUQ4yooHDT4j6Rk1lEXgF9rREOGrrTMPRIIMIybGFLIWXWJ
 wjJIMfSAAzd3SjcNE2onspr61zv3Dx09DUrft4gSVxXMvkiMWygxwmY02hWJpNKomIr+
 IOlHA/7luXWEEYvpb7WGJlC6hV5kmfZn5kfyAMOkzur58sYAQ1w7ps+XT6rsopaTgAjP
 uUj9PMk6hakdRUCCaaU13Kgq05/ZYD1/7QhSWIRUPHTexQeDWPTS/OMOKZVh0kQawc1t
 dnmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3QZZ+k5x6FcOD3bRBnV2aVmE08qbQkSo7atZFKZVUk7siouwaUw5fsSr+hQtOz98jiUeZU+mkbG4yhVOdtX7HvOWGm0FyPEJbUnJRSQ==
X-Gm-Message-State: AOJu0YxFtSi04ekQU4mVOxNYaemkvpFiXTOdGIoyG3fH/he+Owmi8NMz
 z54ScLqKj3I+MVIljvVq81aO58RHoFu4Iu8Zf4/WbhuiYAFvakupCn8IemwZfD495hAwzIX/PkR
 994q4aYMy5DHOCSznfa/RiXrv1HbAyRvwuVYpDhQ7d+av6GMuKNRhHca/4R/qKas=
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id
 5b1f17b1804b1-41fead6cf75mr264210115e9.38.1716226225960; 
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMmMEs7oji54nqFuMmTpApMjr4YzjaiuZ5JCC7hPNaB7rGOq5cC8QRnepVmquMDWE6o0wJg==
X-Received: by 2002:a05:600c:46d3:b0:41b:6753:30be with SMTP id
 5b1f17b1804b1-41fead6cf75mr264209785e9.38.1716226225566; 
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420e88b71a2sm69373295e9.31.2024.05.20.10.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 10:30:25 -0700 (PDT)
Date: Mon, 20 May 2024 19:30:22 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: Device / Driver and PCI Rust abstractions
Message-ID: <ZkuIrveTDOCei2lM@cassiopeiae>
References: <20240520172059.181256-1-dakr@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240520172059.181256-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

https://lore.kernel.org/rust-for-linux/20240520172554.182094-1-dakr@redhat.com/

