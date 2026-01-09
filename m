Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D4D0BA5D
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 18:30:33 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD91A10E91C;
	Fri,  9 Jan 2026 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="FBvJ9irX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FA5844C82;
	Fri,  9 Jan 2026 17:22:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767979326;
 b=ZojnQhiHDGPuug2oZikrS2w1Xu9W7pY9OgK+cHnddpQe2CuK7T1YxcZQDUOKrKIM0M7+3
 r5Orh0yxMdk1BmGiuiFtP5MBnERGKmIdK0W7KaiSj99F510D9ayG9Of2mRoQTEL4sDejuGL
 YrkFrzU4TTD8fBl+N4g4l2z6qky1DusqZJpMBAh/GKjMsYQsVr1JoTlBOGCjrpjchn2ZOiQ
 8le8+J+7ib+p+5pmf4LV/Qr2c6SWSrg46E7Vbm56VTIHVmGb4oiLpTxkjMLYBnjIeNqMm5F
 /+6u7MzSuRwhUPEHOnQlkgAfvaAoIpDQBlbD8X70OFNJeoOYXbyzOk+EJqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767979326; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jBa3BfzXRQYdF1iMoYKyfeZdw52+KwchtSwkEBOxNPQ=;
 b=wyKGG6w6Uvi7HzrB5V1+4IN7a8jhz3jmK/qYB1Q0tCohT0o9qTFq8EG0ULTvc7Y1dJCuX
 INfMkbl7mhNHnT4QVfMoU5qdZ6bi354wF+2+7gxNweccyC7R9rFHeOMP0Pgq6FaKzSeRvxH
 pSGCi8/LqfY4Dx5grEjQq27H2dsujk3DURdAznGj2Z1gvttxeOnflnT4ktUoPPCYcgJsQ+x
 S9wYHof7n3XiFUgH+cL+JWM5kGzYJ6YKD46XvDx7gEFaMaiZVSORDJfg8Fs8d5Wp9BG6hqS
 xWcAsT1kvWCV51rj+iiC1AsEYwvuOM8SAUrvmNoIidnnMIQoTCgiTLNoBezg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mary.zone;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E958D44C4B
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:22:01 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55ABC10E78E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:21 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6505d141d02so7108609a12.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 09:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mary.zone; s=google; t=1767979820; x=1768584620;
 darn=lists.freedesktop.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBa3BfzXRQYdF1iMoYKyfeZdw52+KwchtSwkEBOxNPQ=;
        b=FBvJ9irX4fNv/AchbglvgIkquvHxlKBAdnUBTRMKx7a4Kl/JvtbjgfDIaE6TQhqb9S
         Og+ipjuwZnmZD0gHeJvBRdN/QHlbIkxOIEKtO5V0c6xU7kyfPblfJgL4l1ToxCBqfJlD
         2J7u9FtXC1VLIV/V0A3f60mIVyBn1LgeukigSoloHmhVqsZmRUYpZTjsP2Z/Q0oLw+Js
         QnVDTQQPqKZwEdvnfj6mdeVRJvXQWmMKLKdZpWMdRMNvqIVruTLFavr5Fy4JiwSZOoyl
         zqIubgsincwkO9bxXZowmCH9Hl+toSCWlYJC334uPbfpwEgQZ2KQJUH+DBBesmGiJ1vb
         WOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979820; x=1768584620;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBa3BfzXRQYdF1iMoYKyfeZdw52+KwchtSwkEBOxNPQ=;
        b=nwkTjZ3iX9FQVXBr6wiR0UPNghDmTAnPUM2KUmR/51fcPz0HJV6l4tFbq3iVooXW1F
         TymHzDn0LnV2d3tu6RKsFM1DHTZobTrX44JQH3xca4ge19RECHHxEZj4705GnVouAl5v
         sbqe2pwKMm8hPQwrBeQ2J+GTKt5cX3s+AtRqVIP/oZZ2TcDygHZ6sm9yLzVyxfkY6YjJ
         QlofZAa5+n7sFnJI2t48NXNBoEbDYY54TEfBG7Evl2eQ7rO06Eba0l3NTvumv/jZyzLD
         6Mf3z25OQ1kTvn5vRC8qPiQpIyRiIiIBuXhfCVKOaGQNyZ/aPpCj3Sur6ZnRX5+e3sgu
         NxmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr8nmqn/XB7ttAHVaJDgvI0g0h5gq9hSQ8ESxy4LyE1/VtQq0Nx3au7ZpUnLHCo5xMw4S4296S@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg3RFXj/4Xe+hZBlTBFoXELYxfjUJopqG6FM0u8PuGTj+8OOWj
	ebwwBcUU6pz1J26S1qtwk4cePUYtAlCnsJyG6VKh+W0BwY3ysDEJ6ksHRp6BRQ2JOZM7pjXLZ6d
	QE56m
X-Gm-Gg: AY/fxX49kR78h6D2VHr09Q/zY4iVkjRBKqc4Bj7poyahjEvw2RvUKwGi2BNuNbClWQw
	DXlqGjPm8xdvKMzebE27/DMFKWQbyDDF3QwfGG+b3l9Hpqkg4+uXasNVt1zLrakFW5bY+wA6zY8
	R+0dVgv8lHsfDb6iQ/R5JoSCjDjIq6IxHP4+T38Eu1LONAPWIDDx2g04nFLmJACy4X6P4ivjT7p
	OX6zHmEtSraj5PeVuD9pXsPJRUkWIP5iTYPdaXj5VBNbxkxGFNYCBqjOZayLO0hOXg3turF4G7P
	RFRx9LynxTO3iB+3gicCD5k6y7R/ejyAMj1wr0mygAYH7qwiBMi5m1bSfSnbaW8TUXckYhJo1Kg
	yCFU89Ksok/f3FpBPDa0yaHaMnDi0FfAgz6r2LDeLvUNUNMeEi9ifaOD0SXWXWddY73Z4h38Ty5
	jLu7VQNJFIUxWVKGWEJ3ZM+34Ls9/3/tVC3cpCJV75TN2t41J0/qTAssK3//LvTA+08MJjkDM=
X-Google-Smtp-Source: 
 AGHT+IFBrCHXiIOeuOq9ikzCa/ORwREKVLnQrUPDKwsb6wIjhSdXMJ8CCX/1lBqXnevVQ51tP7rXDQ==
X-Received: by 2002:a17:907:3fa4:b0:b71:1420:334b with SMTP id
 a640c23a62f3a-b8444c40046mr957355566b.8.1767979819429;
        Fri, 09 Jan 2026 09:30:19 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:30:19 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Subject: [PATCH 0/3] drm/nouveau: Support larger GPFIFO ring buffer size on
 Maxwell+
Date: Fri, 09 Jan 2026 18:30:09 +0100
Message-Id: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMBAF0avI1i5ERVGvIhaL+dFtEklQBMndD
 ZavmHkpISoSzdVLEbcmDb6gqSvaDvE7WG0xtaYdTGMm9uG6IRfvp1MXWP0WIQlspcMkYw9nLZX
 6jHD6/OdlzfkDpMND62kAAAA=
X-Change-ID: 20260109-nouveau-gpfifo-increase-da3e9a85efdd
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
Message-ID-Hash: I2SSRIBSYYGRZCXEGFHZOKFAR3HWSIMX
X-Message-ID-Hash: I2SSRIBSYYGRZCXEGFHZOKFAR3HWSIMX
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I2SSRIBSYYGRZCXEGFHZOKFAR3HWSIMX/>
Archived-At: 
 <https://lore.freedesktop.org/20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series increases the limit of the GPFIFO ring buffer to 32768
entries on Maxwell and later.

This allows up to 16382 entries to be used by userspace instead of
the previously 510 entries and should help having more pushbuffers in
flight.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
Mary Guillemard (3):
      drm/nouveau/chan: Store channel allocation details in nouveau_channel
      drm/nouveau: Unify GPFIFO ring buffer max count query
      drm/nouveau: Increase GPFIFO ring buffer size on Maxwell+

 drivers/gpu/drm/nouveau/nouveau_abi16.c | 37 +++++++++++++++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 23 ++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_chan.h  | 19 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 ---
 4 files changed, 64 insertions(+), 18 deletions(-)
---
base-commit: 0244539f9a4f3b564604dfe4d639f61cecec381a
change-id: 20260109-nouveau-gpfifo-increase-da3e9a85efdd

Best regards,
-- 
Mary Guillemard <mary@mary.zone>

