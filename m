Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F697E433E
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 16:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5873B10E12F;
	Tue,  7 Nov 2023 15:18:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5620B10E12F
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 15:18:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9de7a43bd1aso482910166b.3
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699370315; x=1699975115; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUSa9JJh+Y2Tsk/ZlJbgPDREcy0mvtW6TANBnqjh1wQ=;
 b=uT3r8Qjfg8lIn5qF+IoAOsgzrmB6IrbhcFnN0+qJN9OUZMprNNopxTBbOKFz+nrTPp
 wvxoEBkDRaoNjEiZeICCr35RETPmJ8nDj5VpkRdLI8yP1RFu00vFxAiARPmwOtzIizCb
 bP59Cn7IrfK9Trwt1s0NqCzVSOvAvuES9y88ZVMn30iGxcqJvZj81RPQBkrzdSB0mZU7
 lS15PDx1BPnkMAakK0nz4YHh9A+g3GVittrh3/8wsI5t13wCvAnVWY6pJvi6TyCJCArj
 V1jbTH44oEFoTFu5GtSkqpakisGghtFt6p52shgiv++b2YxmOKkIbFjd2XzuVALOmQE5
 4fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699370315; x=1699975115;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUSa9JJh+Y2Tsk/ZlJbgPDREcy0mvtW6TANBnqjh1wQ=;
 b=i1j5z+ae7fiWTQkckeSAWKYmzlDERSfazqbwcbMIdq9t27wLVCZaFy/8stZsfjbEPr
 1L35WDRUiAAqmikCUbIT56JMiRNgPStRxRtZlHnc2EowISsLMzR79xMPoF00U/zv2x9l
 SnHeNHd2iIDH2S7Ypea0H65yQa0dfzdGmgq/NfLxFjmoE02n+UtUt4/6aJQ3nv/TymDP
 y0f1f3tH0ceVfpx+Pa64FIdl3HvI0bOcwEF6/ynH7n/aWy2sFKnVua/3Fb22cfuqvWqi
 6aUiwyxHI22+UD5ke9kpC9HVLIswqTOJCiZZtrfuh3A7tPsDUNpaQHtEsNYSmbml8RqT
 OKdA==
X-Gm-Message-State: AOJu0YxoNripKt3mB6o0jXfuo1H+nB/dI/I7gpdgdlVyOBTuuJGAnPlE
 5jImQ2L4xwD5/cmyqyYJxtrmiQ==
X-Google-Smtp-Source: AGHT+IFg6GPZSi72q4OKki21JP9gaI3a9ZForMI5DrtJhxl7g78VZhTmgTSiHs8/MHjFffQFk6b3jw==
X-Received: by 2002:a17:907:7fac:b0:9c1:9b3a:4cd1 with SMTP id
 qk44-20020a1709077fac00b009c19b3a4cd1mr20872644ejc.3.1699370314775; 
 Tue, 07 Nov 2023 07:18:34 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 lg20-20020a170906f89400b0099290e2c163sm1131200ejb.204.2023.11.07.07.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 07:18:34 -0800 (PST)
Date: Tue, 7 Nov 2023 18:18:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Nouveau] [PATCH] nouveau/gsp/r535: uninitialized variable in
 r535_gsp_acpi_mux_id()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The if we hit the "continue" statement on the first iteration through
the loop then "handle_mux" needs to be set to NULL so we continue
looping.

Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e31f9641114b..afa8e7377a76 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1159,7 +1159,7 @@ static void
 r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
 						 MUX_METHOD_DATA_ELEMENT *part)
 {
-	acpi_handle iter = NULL, handle_mux;
+	acpi_handle iter = NULL, handle_mux = NULL;
 	acpi_status status;
 	unsigned long long value;
 
-- 
2.42.0

