Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A119534B044
	for <lists+nouveau@lfdr.de>; Fri, 26 Mar 2021 21:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49E6F489;
	Fri, 26 Mar 2021 20:38:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E61B6F488
 for <nouveau@lists.freedesktop.org>; Fri, 26 Mar 2021 20:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616791105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IP5jauqp8OdsjP5x9O7uuZxVtg2NRwZRq+0ra1AIJtU=;
 b=JxelK1OPP2f+M7S1DPp00heVO247+14n047nX/YvuNGa7gJMnS0xPl9QXiYVsmRwQTf0VU
 YrO2fMhBbPo3eyAq8QS9Js/6tzIVNXj/EWC2WxowvRNhx+9+J3Glxl/wPHJOmEANRMd89h
 BmhvSYO6+U6OEysupt7wVYNYUriMdyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-7CleN5A0PKusiXcy6HW4tg-1; Fri, 26 Mar 2021 16:38:23 -0400
X-MC-Unique: 7CleN5A0PKusiXcy6HW4tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E1231009E29;
 Fri, 26 Mar 2021 20:38:21 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-114-133.rdu2.redhat.com
 [10.10.114.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F05D5DAA5;
 Fri, 26 Mar 2021 20:38:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Date: Fri, 26 Mar 2021 16:37:48 -0400
Message-Id: <20210326203807.105754-2-lyude@redhat.com>
In-Reply-To: <20210326203807.105754-1-lyude@redhat.com>
References: <20210326203807.105754-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Subject: [Nouveau] [PATCH v2 01/20] drm/dp: Fixup kernel docs for struct
 drm_dp_aux
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

* Make sure that struct members are referred to using @, otherwise they
  won't be formatted as such
* Make sure to refer to other struct types using & so they link back to
  each struct's definition
* Make sure to precede constant values with % so they're formatted
  correctly

Signed-off-by: Lyude Paul <lyude@redhat.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 include/drm/drm_dp_helper.h | 44 ++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 632ad7faa006..5efa0d329b67 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1844,34 +1844,34 @@ struct drm_dp_aux_cec {
  * @crc_count: counter of captured frame CRCs
  * @transfer: transfers a message representing a single AUX transaction
  *
- * The .dev field should be set to a pointer to the device that implements
- * the AUX channel.
+ * The @dev field should be set to a pointer to the device that implements the
+ * AUX channel.
  *
- * The .name field may be used to specify the name of the I2C adapter. If set to
- * NULL, dev_name() of .dev will be used.
+ * The @name field may be used to specify the name of the I2C adapter. If set to
+ * %NULL, dev_name() of @dev will be used.
  *
- * Drivers provide a hardware-specific implementation of how transactions
- * are executed via the .transfer() function. A pointer to a drm_dp_aux_msg
+ * Drivers provide a hardware-specific implementation of how transactions are
+ * executed via the @transfer() function. A pointer to a &drm_dp_aux_msg
  * structure describing the transaction is passed into this function. Upon
- * success, the implementation should return the number of payload bytes
- * that were transferred, or a negative error-code on failure. Helpers
- * propagate errors from the .transfer() function, with the exception of
- * the -EBUSY error, which causes a transaction to be retried. On a short,
- * helpers will return -EPROTO to make it simpler to check for failure.
+ * success, the implementation should return the number of payload bytes that
+ * were transferred, or a negative error-code on failure. Helpers propagate
+ * errors from the @transfer() function, with the exception of the %-EBUSY
+ * error, which causes a transaction to be retried. On a short, helpers will
+ * return %-EPROTO to make it simpler to check for failure.
  *
  * An AUX channel can also be used to transport I2C messages to a sink. A
- * typical application of that is to access an EDID that's present in the
- * sink device. The .transfer() function can also be used to execute such
- * transactions. The drm_dp_aux_register() function registers an I2C
- * adapter that can be passed to drm_probe_ddc(). Upon removal, drivers
- * should call drm_dp_aux_unregister() to remove the I2C adapter.
- * The I2C adapter uses long transfers by default; if a partial response is
- * received, the adapter will drop down to the size given by the partial
- * response for this transaction only.
+ * typical application of that is to access an EDID that's present in the sink
+ * device. The @transfer() function can also be used to execute such
+ * transactions. The drm_dp_aux_register() function registers an I2C adapter
+ * that can be passed to drm_probe_ddc(). Upon removal, drivers should call
+ * drm_dp_aux_unregister() to remove the I2C adapter. The I2C adapter uses long
+ * transfers by default; if a partial response is received, the adapter will
+ * drop down to the size given by the partial response for this transaction
+ * only.
  *
- * Note that the aux helper code assumes that the .transfer() function
- * only modifies the reply field of the drm_dp_aux_msg structure.  The
- * retry logic and i2c helpers assume this is the case.
+ * Note that the aux helper code assumes that the @transfer() function only
+ * modifies the reply field of the &drm_dp_aux_msg structure. The retry logic
+ * and i2c helpers assume this is the case.
  */
 struct drm_dp_aux {
 	const char *name;
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
