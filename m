Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97144C48323
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 18:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409310E482;
	Mon, 10 Nov 2025 17:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=mary.zone header.i=@mary.zone header.b="A+Erj3Kl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508D610EBCD
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 14:18:12 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so397129266b.0
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1761920291; x=1762525091; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dpOwsW4OaXt3IO+YhE8vGcbgUYzLvgd4DmQgy491Rb8=;
 b=A+Erj3Kl6+O8Qmf58MKPu+cb5A762bKJoTAeVfIHLTd4AqWJbepdUGpqwM9ic+TJfI
 cWYrXRxyc9IoRkcsN1CmzSapWWeWcUXZ5tp5+CKiJHno9xLehU/DEeRv68dzyAZbgUsI
 uKgMJO1YYEfyFzL/UpOO/UAAUSBiLiuAzW7JgeKwvVA5eiujbwYX3e5MOOcSa3QkTkKL
 5VV556PtjQ/NV+d+KbloTpdcVvR+S2qfl2n4+55Z6LaD8L3paUteK44DYa0B9NfObePE
 uGz3+4WfJqA4m3BEvnh9rDOSoPKXTmY2bNGPNrLLa6+wJhyhd3pw8LSVVFXBq69OhAao
 PLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761920291; x=1762525091;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dpOwsW4OaXt3IO+YhE8vGcbgUYzLvgd4DmQgy491Rb8=;
 b=VN7qmGVlipR3nZLbTf6Fbnu4RXFlugHdEw+TzgL3YMZZPNev6bIWtHWtDVzlkkG6DG
 +vx06xqeJ++/KY1Ry6IjzsIk5+lrkBAD8V393q8s5TmePkg87y6EBvnisjyflxocjz5o
 XPIwVVX59++A8wbv5Krif+1ffhixVKwYI9UVY9uiJZnbmrP0JRNzSUK83t6TrbuPWbuM
 Eu6W26YWcD1owedFUTWb4uEaEmJmI8TFH65UJ5ueTzqfVNVnIMNIx/6AajaIghhh43yj
 rDrQHbVdkftPMqnZbaze2ilxXub6mwWGKufmDyAAGGmR7NG8KGS8hxTePnnlbEDBaili
 84Rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Fm+ks6nl4M43J0WindorkaAQqW6k483pJUjWAutEjimhpynUmE6ozlNpDEFlKIRfzuuG0TRK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuyfuIqyTOIMcMcBZ4e0xlFCFqoKkmxXuFqxsZwDPzT5c8ow6a
 GP0Z+f0VOxjH5gTulH7xuakhmVkz5N8W9w2W6hVkXF5bhe/3hR38VOjKrT/mj3glhEs=
X-Gm-Gg: ASbGncv0726bGyG7Ho6MYrbdtKIde4nyZJkO+toXlc299Be6mxuNb3m/6LLYP63p/o/
 VQH4zoA5RiinivrPfwmxQYUXgHRwvAqvU8aKC4ungtJ1rKgcWRs39e7eB7ZtJ/cmVSU0j27Q63I
 v6u1cE4UaF7qgchbk5c449K46hBLslCDfk1Dkr8EF9BoqVdKWaESlm17K3xCkBnb/12vmV/EKxm
 iJTF7j7cN0wwxfjAzj/nmsIiW7KeKFtZ4ssB/RFxlLis9R33jSMZyShj5EoP5Jx1HgUX1V4alpt
 SgiyaYeN0DTvhrgkEj/tVShk5gWzdus4EIWUDAwO6X0mowDD2YkM2JHkG9XNaI9cnk5tNP1yfdy
 WEQqSE/yAddHAksaNhjEyAhYwT01V3i7yKdOPSBYlO5rz1vch5zAYTOAvLZHy/BZWNpmMAdvMoI
 6ogPQm3nnRa/+fbyp0b3P2js506RPJTwFrVJ2nfpqkOfNduSxzg0/v
X-Google-Smtp-Source: AGHT+IG/on2h4t3AE4tA/aWcwth5JN9h8ZraeYNLOQDKECZbI1ZJ38z/033kuQ3rG2khwd8SssYwHQ==
X-Received: by 2002:a17:907:1c93:b0:b04:9ad9:5b29 with SMTP id
 a640c23a62f3a-b707082f754mr437109266b.54.1761920290566; 
 Fri, 31 Oct 2025 07:18:10 -0700 (PDT)
Received: from caroline (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b70779a92c9sm185644766b.22.2025.10.31.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 07:18:10 -0700 (PDT)
Date: Fri, 31 Oct 2025 15:18:08 +0100
From: Mary Guillemard <mary@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v4 0/5] drm/nouveau: Enable variable page sizes and
 compression
Message-ID: <aQTFIN1dPHVtL4NR@caroline>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
X-Mailman-Approved-At: Mon, 10 Nov 2025 17:05:26 +0000
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


Series is working fine on older versions of NVK and with compression
patches on mesa side (tested on Ada and Ampere):

Tested-by: Mary Guillemard <mary@mary.zone>

Regards,
Mary
