Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB313B0CAD8
	for <lists+nouveau@lfdr.de>; Mon, 21 Jul 2025 21:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA90D10E2D5;
	Mon, 21 Jul 2025 19:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="jPUqHwqU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8754A10E2D5
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jul 2025 19:12:27 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4ab554fd8fbso46458011cf.1
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jul 2025 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1753125146;
 x=1753729946; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=jPUqHwqUqOjdYGXf/4QAGaYYPgecZHMxZZi3obKb5aQUHjT5O2fYAlRxvxYH4rrJ66
 jFoJhYARmxq0DJ4NX8DYy50/4onbY3EIuxWwdemy3Few0mSpS99kW1fmc1R3ZtAL1YFP
 0PcxUSeZkYSsxuiW9QlUf8X1VpHlepCEahaIgHnQcI8uL4QKLDa3zLFA5BBcDYdwwpKn
 Czl10XEe7ng7GZlK5J/+XeLitRKY+OEIsWS01XwbKDZqQQpsRdqWzhhbH6GjB/oEfrff
 Lb1HLW8x2nqvHXoxpsLwaaKHkoGK3UsjuGwvMfKenn6HRh8uxIARTsff4gm/2rVSf7Rc
 DPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753125146; x=1753729946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/lUkAmcsFJuKtRa8jpai2ZZYWb/fYbdKwA84kAMpapI=;
 b=lnkF52+doI4ckdtSh8vpRK9d5Yz1wBjGdBm57Xed94fO7QgsqEASka8Ffjjkgvc17y
 j9MaedM2+lXqO1QEzzwZFlAwWmVNt7eSXQVdF65O+pSVW9L6iEJniwVWHWbavEKFercQ
 MZsI4mVKfdIQjNmIdLb2fncXLb1YhutPW8b1bjYGGC6zWmUqVBM70Dm+y/doxn0/J/g4
 5fc3y4GlqWdcmI+B/ATh9oYS1MGG3IghniFnnQL12iwPXuA8Q2UE6XX04wEeqBK1vl83
 k2yoRxTGE7dWGcO/tviIu88xfeUuLVborEZo5YIm6wH5zxNnDJujpZlvSHkkN0eYueRz
 uhXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq4K6N6/7+xwumxxtK4b5q6X1WSsZ4jSqfp+gYvZsX4d5zRIZ5uBi9eCKrJmJcPmvLubnmfj4x@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXPzwSWIlkliS+SX4avhCWenThfj7AEnk/BYq3NpZp1oDLGLmI
 V0cAnjQVgvH3ThdmuKGFD/0tGcDcUWw6lhMi97ZvreLVtSdJo6LyaEDC12GoLj6GarM=
X-Gm-Gg: ASbGncuxfX72Qy43iXKmjEu9o1DTdLH9+UrUEhYxNvQu3IjF2S1iPcFYsdyo+wjBG81
 KYCDtKA1JoIG7fVRNuTHGR4zDbwOhO8qXqIImYDRExcIoCA6qXBEJ58wye7m9tcTSIfR2oCfBlO
 pBqWwPaJAwB1b7+gEtMLpPe55PBG7+tUV7HNlprQSyhB+gnIa2EJl1cm09i2+iub0VGLIBeqL5z
 1Kj9VTNCCkYzeXK4KsvV13zWsX+SuOBBWqKCYXf5UOFOOXHTy/guBVlEiKYjTHO5CFo4JsSGaHs
 uitaIjvw6HAnBeYvddlXyt0xidfN0AfuNtgQ989j+kWJ3s765odPnqvnsd8deiuH6TBb75HOoga
 LHCP9u9wJn5c7lphlIEAprAGksekpLPCRx3WpZtAFuw==
X-Google-Smtp-Source: AGHT+IE1V8c9uplMGuY3pa4ZHwW+fD6G3k8YPKLQmOAwc6WL4bYVHqr7BUKzKekHOuoNGznzU/qCKQ==
X-Received: by 2002:a05:622a:4c89:b0:4ab:731a:541c with SMTP id
 d75a77b69052e-4ae5b72633dmr11924731cf.2.1753125146207; 
 Mon, 21 Jul 2025 12:12:26 -0700 (PDT)
Received: from m-kiwi.verizon.net ([108.27.160.38])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb4b24930sm44626211cf.51.2025.07.21.12.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 12:12:25 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, ttabi@nvidia.com,
 bskeggs@nvidia.com, martin.peres@free.fr, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH V2 0/3] drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
Date: Mon, 21 Jul 2025 15:09:13 -0400
Message-ID: <20250721191214.19800-1-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Following earlier discussion at
https://lists.freedesktop.org/archives/nouveau/2025-June/047887.html
this series removes DRM_NOUVEAU_GSP_DEFAULT.

The first two patches are the same as they were in V1. V2 adds a third
commit that improves an error message in response to feedback from V1.

Mel Henning (3):
  drm/nouveau: Remove DRM_NOUVEAU_GSP_DEFAULT config
  drm/nouveau: Remove nvkm_gsp_fwif.enable
  drm/nouveau: Improve message for missing firmware

 drivers/gpu/drm/nouveau/Kconfig                 | 8 --------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c  | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 1 -
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 6 +-----
 8 files changed, 9 insertions(+), 20 deletions(-)

-- 
2.50.1

