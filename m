Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC9224E35
	for <lists+nouveau@lfdr.de>; Sun, 19 Jul 2020 00:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3C86E14D;
	Sat, 18 Jul 2020 22:53:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB196E14D
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jul 2020 22:53:25 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b4so12036103qkn.11
 for <nouveau@lists.freedesktop.org>; Sat, 18 Jul 2020 15:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1T+md5Mv4ugkdlmadYaCWkgvZissL/VLaT344KM72Wo=;
 b=eMxcduVkwDOvpImiR+6N/KSiKIOQTwxX/l0N0B8LoTfy2/7Wx/6TpcHJuIwqoHMs/+
 ybjNdFfSgyZjJQXf3fkPy2W2YVM3xhilL2xFJjQIrEyVrBhZvG0MQwL40FG/nIcqFrq6
 l8/ocpihmCH8hLZ6oZvUCRAZ5Mjdy/a9rXXHZYxwAfVtkiXBM5JgERO6Zqy5wsZ0daLG
 kt74NN9iCrohVd3lSO1J4l3/D7iWyLaY8g/1khRg/iXVMST4c+OaCDJVK32gZTVCCVWE
 KTIKE4A7aYWkPLrL6bts/LQoN2CMCIbHkaKlyNKAHAJBR2NpSKLNoOtkk+CyM5dkvFku
 ogzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1T+md5Mv4ugkdlmadYaCWkgvZissL/VLaT344KM72Wo=;
 b=NGaiobJp0aBHHALViBGvpamGxTAUK70HONMwXHsDx9Hu+jZ60zQh7E2ZRYUsjMb27p
 2BEqYX9FPOs2ioitl3ypVkrmC/W3YhyHjGrC1AmwMhStk9RKHoLdo5ozmFa9EaBZGwG3
 JAZDViEsJXHSWeFsfrz6nf0YmcaLhOTtiNvMeJkr5lO047T3zoo+fzexFGzF0V82JeyE
 EMOU8sZXYQnBtnp2nfQELgdxIkbjmhmITSorFcIFNhmEgwdvY0a8ouJtsmjEYS1YBMiZ
 XyzvNtFKTZ5G7MfxhxNLoQ5n3bYlATxMIAsrjzsAXMU1nI78fP+nxd84Jj4cg4us84TX
 lCZw==
X-Gm-Message-State: AOAM530Rf9lcD/angkVpScY554z759fEWNWbMSsz6gPMjLNyHwyZjn46
 BRLlI3oq2Y5Jjs+w4G6a5wEnmcWKYKk=
X-Google-Smtp-Source: ABdhPJweps7hrSbkfcqChBVgI6/3tvUWGAw9AVEQgw9QI5ZNUSQbWIA0jcvr5N3UVquH5XlQAv07iQ==
X-Received: by 2002:a05:620a:3de:: with SMTP id
 r30mr2791190qkm.221.1595112804890; 
 Sat, 18 Jul 2020 15:53:24 -0700 (PDT)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id p25sm13859978qki.107.2020.07.18.15.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 15:53:24 -0700 (PDT)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: nouveau@lists.freedesktop.org
Date: Sat, 18 Jul 2020 18:53:19 -0400
Message-Id: <20200718225319.27884-2-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200718225319.27884-1-imirkin@alum.mit.edu>
References: <20200718225319.27884-1-imirkin@alum.mit.edu>
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 2/2] present: don't enable if there's no
 acceleration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

All the present logic relies on EXA being used to wrap everything.
Unclear if present could even be used without the other things EXA
enables, but better be safe.

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---
 src/nv_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index a63674c..e72a6b6 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1489,7 +1489,7 @@ NVScreenInit(SCREEN_INIT_ARGS_DECL)
 
 	xf86SetBlackWhitePixels(pScreen);
 
-	if (nouveau_present_init(pScreen))
+	if (pNv->AccelMethod == EXA && nouveau_present_init(pScreen))
 		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
 			   "Hardware support for Present enabled\n");
 	else
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
