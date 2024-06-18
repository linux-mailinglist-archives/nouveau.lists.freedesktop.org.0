Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF490E00F
	for <lists+nouveau@lfdr.de>; Wed, 19 Jun 2024 01:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF14B10E81F;
	Tue, 18 Jun 2024 23:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gvjKHKgH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EAD910E813
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 23:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718754174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
 b=gvjKHKgHstZD0iCmQNPg5uoOQkdmvUiXaL80tR0FPVBTDVj2lk5Y3/TpNOcxt7uyGo9X1V
 V7sk7k+bosHbujhlsRTeXG89fVbJ9vwlsXnFU9+zm01OYIDEcQ4pactUCVJIoU6C8JGekV
 bf6NladAa5ykz5caBADZh6hhXfFzg1g=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-uVpBwwDhPuGDbHWDT9LNaw-1; Tue, 18 Jun 2024 19:42:52 -0400
X-MC-Unique: uVpBwwDhPuGDbHWDT9LNaw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ebeef33f21so50384191fa.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jun 2024 16:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718754171; x=1719358971;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3Z2evdNPMBXT7admKZAc1Ne4tYdRPgWACHYuEqy2nE=;
 b=f/KcBdtfuZxI8QIX8U793FxOrCbzT0ec6Limk8zZWFW+TtH/lpgGTdr2x/vhnabxzP
 eTBfjV/h6NWjo3Dpj4Lap4GRLlzAoxI1hd+fCDHO6plQ+eMTLLq9A9/RA81kV3D0Kx3x
 L1YLFP2XbbC+pNO3eYe87W/+/duBUkFNbb/OaIlTM/xIGlvhAEUM0OKODOxPpvNk0xXD
 PWiE9y6IoRvAcJPdLuRipLN8wKBhZ/J+YpWYy+a9ik8p1PfmSHYoUHPz1+YEQYXNXsn+
 aF85pBnXcsaNGnNpo5CPQMxIswJYr/Rkb0Muw8983V3V5Vi9OioeDb8y+ioShIZaZwnp
 Wjhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXriSBt8n3+4gpc0dnJ+vJQqD6NEb0Cg4jAebhpJDlvdOWYxbXSrPdKXChIkR3doAONBbnsdHZjboCBffxrErDyW5+4r0UIEn5G+ILeoQ==
X-Gm-Message-State: AOJu0Yz5fYzpFk6glg8FdYJGNksOz7V9JbnLp3vODH6TQb20Z7/rXfo5
 hQegUe2/fZqkuv1ptBsXprfEWgV1nm+SYhzXz+7Ks64CNnjKyo7VFEJ8zz1n9wsqSgowkMKlo0J
 BNPuZVALOwwFvbfm2g2bo7hbjjHJoaeKQNZADg9rm/Qq8NiGmsu4a58H62/BFUws=
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id
 38308e7fff4ca-2ec3cffc4e1mr7588641fa.45.1718754171324; 
 Tue, 18 Jun 2024 16:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXxWA0oSKg9/uHRxkYZqgQapFgTGUJtV9NxLiRf53cMqUzSCZPEdoUfvLiePJ4nZRU6sP21w==
X-Received: by 2002:a2e:2c1a:0:b0:2ea:edac:4886 with SMTP id
 38308e7fff4ca-2ec3cffc4e1mr7588381fa.45.1718754170863; 
 Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f8be0c69sm208261285e9.33.2024.06.18.16.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 16:42:50 -0700 (PDT)
Message-ID: <c67afe11-82b4-4ef5-8ef1-cfed502b545f@redhat.com>
Date: Wed, 19 Jun 2024 01:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Device / Driver and PCI Rust abstractions
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
 pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
 gregkh@linuxfoundation.org, robh@kernel.org, daniel.almeida@collabora.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240618233324.14217-1-dakr@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240618233324.14217-1-dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

https://lore.kernel.org/lkml/20240618234025.15036-1-dakr@redhat.com/

