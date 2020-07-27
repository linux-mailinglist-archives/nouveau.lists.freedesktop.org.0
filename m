Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF7423F891
	for <lists+nouveau@lfdr.de>; Sat,  8 Aug 2020 21:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A756E235;
	Sat,  8 Aug 2020 19:18:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67DE89F19;
 Mon, 27 Jul 2020 20:52:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1f3e8d0002>; Mon, 27 Jul 2020 13:52:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 27 Jul 2020 13:52:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:52:42 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:52:32 +0000
From: Daniel Dadap <ddadap@nvidia.com>
To: <dri-devel@lists.freedesktop.com>, <intel-gfx@lists.freedesktop.com>,
 <nouveau@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <bskeggs@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <david1.zhou@amd.com>
Date: Mon, 27 Jul 2020 15:53:54 -0500
Message-ID: <20200727205357.27839-2-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200727205357.27839-1-ddadap@nvidia.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595883149; bh=UqSzLrJiohm6rrbEzjfc0mS1Zrzbn9AmDtJKbOXt2Gg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=kRZZP/68CdYabWyzBX/kauWmzPB2mBnGg3K+yaQt2Ytcq9XsyzCq0+iA36XdbqUTS
 cRtitV2b2sUrBijmtjwGrfBcBNyk70uyzVdfMYJx23EbiE1CoF+bEvqo4bmrKZ2iea
 AOCyPgcSFGiCpeBKH/Odfwdo6/hjSYf/6N0AnbSLUlWuomIfhFN1uWiNJUxt5RURQL
 TNsnnkr+HoilchVz/r88NbYvbWPQdFhF5RvxtlFbfVhQptcHR+8dRDgCzwtcE2Y38b
 sb4oLNE5AlFgVroJvOSa7XnOgzr9KPz4q87eCR6ACFqxmvwo4E5QGEjH/YUh2aNp+j
 LocE3f7AVP40Q==
X-Mailman-Approved-At: Sat, 08 Aug 2020 19:18:33 +0000
Subject: [Nouveau] [PATCH 1/4] drm: retrieve EDID via ACPI _DDC method
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
Cc: Daniel Dadap <ddadap@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some notebook computer systems expose the EDID for the internal
panel via the ACPI _DDC method. On some systems this is because
the panel does not populate the hardware DDC lines, and on some
systems with dynamic display muxes, _DDC is implemented to allow
the internal panel's EDID to be read at any time, regardless of
how the mux is switched.

The _DDC method can be implemented for each individual display
output, so there could be an arbitrary number of outputs exposing
their EDIDs via _DDC; however, in practice, this has only been
implemented so far on systems with a single panel, so the current
implementation of drm_get_edid_acpi() walks the outputs listed by
each GPU's ACPI _DOD method and returns the first EDID successfully
retrieved by any attached _DDC method. It may be necessary in the
future to allow for the retrieval of distinct EDIDs for different
output devices, but in order to do so, it will first be necessary
to develop a way to correlate individual DRM outputs with their
corresponding entities in ACPI.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/gpu/drm/drm_edid.c | 161 +++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |   1 +
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 116451101426..f66d6bf048c6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -34,6 +34,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/pci.h>
 
 #include <drm/drm_displayid.h>
 #include <drm/drm_drv.h>
@@ -2058,6 +2059,166 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid_switcheroo);
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)
+static u64 *get_dod_entries(acpi_handle handle, int *count)
+{
+	acpi_status status;
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *dod;
+	int i;
+	u64 *ret = NULL;
+
+	*count = 0;
+
+	status = acpi_evaluate_object(handle, "_DOD", NULL, &buf);
+
+	if (ACPI_FAILURE(status))
+		return NULL;
+
+	dod = buf.pointer;
+
+	if (dod == NULL || dod->type != ACPI_TYPE_PACKAGE)
+		goto done;
+
+	ret = kmalloc_array(dod->package.count, sizeof(*ret), GFP_KERNEL);
+	if (ret == NULL)
+		goto done;
+
+	for (i = 0; i < dod->package.count; i++) {
+		if (dod->package.elements[i].type != ACPI_TYPE_INTEGER)
+			continue;
+		ret[*count] = dod->package.elements[i].integer.value;
+		(*count)++;
+	}
+
+done:
+	kfree(buf.pointer);
+	return ret;
+}
+
+static void *do_acpi_ddc(acpi_handle handle)
+{
+	int i;
+	void *ret = NULL;
+
+	/*
+	 * The _DDC spec defines an integer argument for specifying the size of
+	 * the EDID to be retrieved. A value of 1 requests a 128-byte EDID, and
+	 * a value of 2 requests a 256-byte EDID. Attempt the larger read first.
+	 */
+	for (i = 2; i >= 1; i--) {
+		struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+		union acpi_object arg = { ACPI_TYPE_INTEGER };
+		struct acpi_object_list in = { 1, &arg };
+		union acpi_object *edid;
+		acpi_status status;
+
+		arg.integer.value = i;
+		status = acpi_evaluate_object(handle, "_DDC", &in, &out);
+		edid = out.pointer;
+
+		if (ACPI_SUCCESS(status))
+			ret = edid->buffer.pointer;
+
+		kfree(edid);
+
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static struct edid *first_edid_from_acpi_ddc(struct pci_dev *pdev)
+{
+	acpi_handle handle;
+	acpi_status status;
+	struct acpi_device *device = NULL;
+	struct edid *ret = NULL;
+	int num_dod_entries;
+	u64 *dod_entries = NULL;
+	struct list_head *node, *next;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (handle == NULL)
+		return NULL;
+
+	dod_entries = get_dod_entries(handle, &num_dod_entries);
+	if (dod_entries == NULL || num_dod_entries == 0)
+		goto done;
+
+	status = acpi_bus_get_device(handle, &device);
+	if (ACPI_FAILURE(status) || device == NULL)
+		goto done;
+
+	list_for_each_safe(node, next, &device->children) {
+		struct acpi_device *child;
+		u64 adr;
+		int i;
+
+		child = list_entry(node, struct acpi_device, node);
+		if (child == NULL)
+			continue;
+
+		status = acpi_evaluate_integer(child->handle, "_ADR", NULL,
+			&adr);
+		if (ACPI_FAILURE(status))
+			continue;
+
+		for (i = 0; i < num_dod_entries; i++) {
+			if (adr == dod_entries[i]) {
+				ret = do_acpi_ddc(child->handle);
+
+				if (ret != NULL)
+					goto done;
+			}
+		}
+	}
+done:
+	kfree(dod_entries);
+	return ret;
+}
+
+static struct edid *search_pci_class_for_acpi_ddc(unsigned int class)
+{
+	struct pci_dev *dev = NULL;
+
+	while ((dev = pci_get_class(class << 8, dev))) {
+		struct edid *edid = first_edid_from_acpi_ddc(dev);
+
+		if (edid)
+			return edid;
+	}
+
+	return NULL;
+}
+#endif
+
+/**
+ * drm_get_edid_acpi() - retrieve an EDID via the ACPI _DDC method
+ *
+ * Iterate over the ACPI namespace objects for all PCI VGA/3D controllers
+ * and attempt to evaluate any present _DDC method handles, returning the
+ * first successfully found EDID, or %NULL if none was found.
+ */
+struct edid *drm_get_edid_acpi(void)
+{
+#if defined(CONFIG_ACPI) && defined(CONFIG_PCI)
+	struct edid *edid;
+
+	edid = search_pci_class_for_acpi_ddc(PCI_CLASS_DISPLAY_VGA);
+	if (edid)
+		return edid;
+
+	edid = search_pci_class_for_acpi_ddc(PCI_CLASS_DISPLAY_3D);
+	if (edid)
+		return edid;
+#endif
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_get_edid_acpi);
+
 /**
  * drm_edid_duplicate - duplicate an EDID and the extensions
  * @edid: EDID to duplicate
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 34b15e3d070c..ec2fe6d98560 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -485,6 +485,7 @@ struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 				     struct i2c_adapter *adapter);
+struct edid *drm_get_edid_acpi(void);
 struct edid *drm_edid_duplicate(const struct edid *edid);
 int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid);
 int drm_add_override_edid_modes(struct drm_connector *connector);
-- 
2.18.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
