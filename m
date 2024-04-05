Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BB789A441
	for <lists+nouveau@lfdr.de>; Fri,  5 Apr 2024 20:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BB3113CB0;
	Fri,  5 Apr 2024 18:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bkmLIHuX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA05113CAC
 for <nouveau@lists.freedesktop.org>; Fri,  5 Apr 2024 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712342218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qvKsrMsm5amCXrkHqNf0dwZRvuZponfYbk9G0oYCwa0=;
 b=bkmLIHuXHWylDHV3WzY3VGR5Ih99VfMb+b8oggnFECST0sWagWeL3urNqjAQnlyCm3vXDX
 ZoBeOGp94qADvpKVLLeifSWsvCVUerTo2AgPjTob6VX+GN24b+LkzUOJdLXyRJZjmpVloP
 eov2PjZSdAnpLKnFLcb1Sup67WKkt2E=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-_S_7_10EPeqVVFQfDgU42A-1; Fri, 05 Apr 2024 14:36:57 -0400
X-MC-Unique: _S_7_10EPeqVVFQfDgU42A-1
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-6e45f6273a2so1525569a34.1
 for <nouveau@lists.freedesktop.org>; Fri, 05 Apr 2024 11:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712342216; x=1712947016;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvKsrMsm5amCXrkHqNf0dwZRvuZponfYbk9G0oYCwa0=;
 b=fFTB4nDFAsVKgHevaawm8MHbsyzTOn1xUJ1Wq45ZEgr9e0b3m3r8E49cfEhyRRRRSx
 yds5bGKCQzhWzuhgsBBgE7XxjNUOszIcyQxVSsd+dREUqqLP8p8V+Ksod0NqhGT7FmG4
 0Wyk3on140IF/WpYHVWwfq2KXbE9P65jVrOwCGxTw08zdYIbUyGFQYVr2cSO5YU2Jlmz
 FMYlarRaJN+cR6Rdg605eFh8Wzq9AkBS6Jh1TSAX5frDlsp3yzb7Al/6Xdz2ZtyzMbl0
 sIv/bnzGDgQ5SbsgJ3UaP1hzZ7av/mqccfn8tDbl8ImGy3atBrVptI3CyPZ1XtHcZgpU
 RYRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRhS7+66DYxqCdhmyq7gGnl+0HQZFBRSysCTWbbEFW8DzRMQ3794g9LUeXYrAn0s/eSbj/0A/5r5GaxGUw2G8KOqLjMUorft3xeQQE1g==
X-Gm-Message-State: AOJu0YyFg8by58uXqooVL769UVgODisHgIXPR/r+7h9gHfRzqQFu+DLH
 1q8lhFFZMhM5LvT1HZJc3fcPyHuCq5kbjfdp3SS3Aj+764VxC8OwLcmawKtrPtr9Qqo1ShAHI8N
 Ux6tz1Byla01uO/BVSz2XsdS81NCztwOqMCl4xcKL/TWhnAiuiu0QItcMp22iFSA=
X-Received: by 2002:a9d:6755:0:b0:6e9:e829:2c77 with SMTP id
 w21-20020a9d6755000000b006e9e8292c77mr2188598otm.27.1712342216614; 
 Fri, 05 Apr 2024 11:36:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt+D771XMHHFySTD83Ks6yYhCqZ6qH+nHPbjpQmLbCiVM6E3jPPssFvgzLpd4PouzY8zRNoQ==
X-Received: by 2002:a9d:6755:0:b0:6e9:e829:2c77 with SMTP id
 w21-20020a9d6755000000b006e9e8292c77mr2188569otm.27.1712342216298; 
 Fri, 05 Apr 2024 11:36:56 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 qr2-20020a05620a390200b00789e2805f85sm854603qkn.21.2024.04.05.11.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 11:36:55 -0700 (PDT)
Message-ID: <190fda6f12aa77170631fb12e505779ce33d1c64.camel@redhat.com>
Subject: Re: [PATCH v0 13/14] drm/nouveau: Make I2C terminology more inclusive
From: Lyude Paul <lyude@redhat.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Danilo Krummrich
 <dakr@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM DRIVER
 FOR NVIDIA GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, "open
 list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "open list:RADEON and
 AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open list:INTEL DRM
 DISPLAY FOR XE AND I915 DRIVERS" <intel-gfx@lists.freedesktop.org>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, "open list:I2C SUBSYSTEM HOST DRIVERS"
 <linux-i2c@vger.kernel.org>, "open list:BTTV VIDEO4LINUX DRIVER"
 <linux-media@vger.kernel.org>, "open list:FRAMEBUFFER LAYER"
 <linux-fbdev@vger.kernel.org>
Date: Fri, 05 Apr 2024 14:36:54 -0400
In-Reply-To: <e6b04b76-c695-47b4-9432-f2316e174585@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-14-eahariha@linux.microsoft.com>
 <4dc6fb16-3d85-4a7f-85f9-ed249da0df1a@redhat.com>
 <e6b04b76-c695-47b4-9432-f2316e174585@linux.microsoft.com>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
Organization: Red Hat Inc.
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 2024-04-05 at 09:30 -0700, Easwar Hariharan wrote:
>=20
> Thanks for the review, and for the appetite to go further! So we are
> on the same page, you would prefer
> renaming to controller/target like the feedback on other drm drivers
> (i915, gma500, radeon)?

FWIW I'm in support of this as well! As long as we make sure it gets
renamed everywhere :)

>=20
> Thanks,
> Easwar
>=20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

